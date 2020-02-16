package com.controllers;

import com.pojo.Ad;
import com.pojo.User;
import com.services.UserService;
import com.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@SessionAttributes(value = StringUtil.USER_ATTRIBUTE)
@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value = {"logout", "ads/logout"})
    public String logout(HttpSession session, Model model) {
        model.asMap().remove("user");
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "toCreate", method = RequestMethod.GET)
    public String redirectToCreate() {
        return "registrationPage";
    }

    @RequestMapping(value = "create")
    public String createUser(@RequestParam(value = "login") String login,
                             @RequestParam(value = "password") String password,
                             @RequestParam(value = "repeat_password") String rePassword,
                             @RequestParam(value = "name") String name,
                             @RequestParam(value = "surname") String surname,
                             @RequestParam(value = "mail") String mail,
                             HttpServletRequest req) {
        User user = new User();
        if (password.equals(rePassword)) {
            user.setPassword(password);
        } else {
            req.getSession().setAttribute("message", StringUtil.MESSAGE_PASSWORDS_NOT_EQUALS);
            return "redirect:/toCreate";
        }
        if (!userService.isLoginFree(login)) {
            req.getSession().setAttribute("message", StringUtil.MESSAGE_LOGIN_USED);
            return "redirect:/toCreate";
        }
        user.setLogin(login);
        user.setName(name);
        user.setSurname(surname);
        user.setMail(mail);
        if (userService.createUser(user)) {
            req.getSession().setAttribute("messageSuccess", StringUtil.MESSAGE_USER_CREATED);
            return "redirect:/";
        } else {
            req.getSession().setAttribute("message", StringUtil.MESSAGE_USER_NOT_CREATED);
            return "redirect:/toCreate";
        }
    }


    @RequestMapping(value = {"toUpdateUser", "ads/toUpdateUser", "toEditAd/toUpdateUser"})
    public String toUpdateUser(@ModelAttribute(StringUtil.USER_ATTRIBUTE) User user, Model model, HttpServletRequest req) {
        User userAttr = (User) req.getSession().getAttribute(StringUtil.USER_ATTRIBUTE);
        model.addAttribute(StringUtil.USER_REQUEST_ATTRIBUTE, userAttr == null ? null : userAttr.getUserId());
        return "updateUser";
    }

    @RequestMapping(value = {"updateUserInfo","ads/updateUserInfo"})
    public String updateUser(@ModelAttribute(StringUtil.USER_ATTRIBUTE) User user,
                             @RequestParam(value = "login") String login,
                             @RequestParam(value = "password") String password,
                             @RequestParam(value = "repeat_password") String rePassword,
                             @RequestParam(value = "name") String name,
                             @RequestParam(value = "surname") String surname,
                             @RequestParam(value = "mail") String mail,
                             HttpServletRequest req, Model model) {

        System.out.println(user.getUserId());

        if (password.equals(rePassword)) {
            user.setPassword(password);
        } else {
            req.getSession().setAttribute("message", StringUtil.MESSAGE_PASSWORDS_NOT_EQUALS);
            return "redirect:/toUpdateUser";
        }
        user.setLogin(login);
        user.setName(name);
        user.setSurname(surname);
        user.setMail(mail);

        if (userService.updateUser(user)) {
            req.getSession().setAttribute("messageSuccess", StringUtil.MESSAGE_USER_UPDATED);
            return "redirect:fullPage";
        } else {
            req.getSession().setAttribute("message", StringUtil.MESSAGE_USER_UPDATE_ERROR);
            user = userService.getUserById(user.getUserId());
            model.addAttribute(StringUtil.USER_ATTRIBUTE, user);
            return "redirect:/toUpdateUser";
        }
    }

    @RequestMapping(value = "toLogin", method = RequestMethod.GET)
    public String redirectToLogin() {
        return "loginPage";
    }

    @RequestMapping(value = {"login", "ads/login"})
    public String login(@RequestParam(value = "login") String login,
                        @RequestParam(value = "password") String password, Model model, HttpServletRequest req) {
        model.asMap().remove("user");

        req.getSession().setAttribute("hidden", false);
        User user = userService.getUserByLogin(login, password);
        if (user == null) {
            req.getSession().setAttribute("message", StringUtil.MESSAGE_WRONG_LOGIN_OR_PASSWORD);
        } else {
            model.addAttribute(StringUtil.USER_ATTRIBUTE, user);
        }
        return "redirect:/";
    }

    @RequestMapping(value = "userInfo", method = RequestMethod.GET)
    public String userInfo(@ModelAttribute(StringUtil.USER_ATTRIBUTE) User user) {
        return "userInfo";
    }

    @RequestMapping(value = {"fullPage", "ads/fullPage", "toEditAd/fullPage"})
    public String userPage(@ModelAttribute("user") User user, Model model,
                           HttpServletRequest req) {
        user = userService.getUserById(user.getUserId());
        User userAttr = (User) req.getSession().getAttribute(StringUtil.USER_ATTRIBUTE);
        model.addAttribute(StringUtil.USER_REQUEST_ATTRIBUTE, userAttr == null ? null : userAttr.getUserId());
        List<Ad> allAds = user.getUserAds().stream().filter(Ad::isAdStatus).sorted(Comparator.comparing(Ad::getAdId).reversed()).collect(Collectors.toList());
        model.addAttribute("adList", allAds);
        return "userFullPage";
    }
}
