package com.controllers;

import com.pojo.Ad;
import com.pojo.User;
import com.services.AdService;
import com.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@SessionAttributes(value = StringUtil.USER_ATTRIBUTE)
@Controller
public class AdController {

    @Autowired
    private AdService adService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String showAllAds(Model model, HttpServletRequest req) {
        req.getSession().setAttribute("hidden", false);
        List<Ad> allAds = adService.allAds();
        try {
            allAds.sort(Comparator.comparing(Ad::getAdId).reversed());
        } catch (NullPointerException ex) {
            return "redirect:/";
        }
        model.addAttribute("adList", allAds);
        User userAttr = (User) req.getSession().getAttribute(StringUtil.USER_ATTRIBUTE);
        model.addAttribute(StringUtil.USER_REQUEST_ATTRIBUTE, userAttr == null ? null : userAttr.getUserId());
        return "mainPage";
    }

    @RequestMapping(value = "ads/{adId}")
    public String showOneAd(Model model,
                            @PathVariable("adId") long idFromPath, HttpServletRequest req) {
        Ad ad = adService.getById(idFromPath);
        User userAttr = (User) req.getSession().getAttribute(StringUtil.USER_ATTRIBUTE);
        model.addAttribute(StringUtil.USER_REQUEST_ATTRIBUTE, userAttr == null ? null : userAttr.getUserId());
        model.addAttribute("ad", ad);
        return "singleAd";
    }

    @RequestMapping(value = "toCreateAd")
    public String redirectToCreateAd(@ModelAttribute(StringUtil.USER_ATTRIBUTE) User user, Model model, HttpServletRequest req) {
        User userAttr = (User) req.getSession().getAttribute(StringUtil.USER_ATTRIBUTE);
        model.addAttribute(StringUtil.USER_REQUEST_ATTRIBUTE, userAttr == null ? null : userAttr.getUserId());
        return "createAd";
    }

    @RequestMapping(value = "createNewAd")
    public String createAd(@RequestParam(value = "title") String title,
                           @RequestParam(value = "description") String description,
                           @RequestParam(value = "image") MultipartFile file,
                           @ModelAttribute(StringUtil.USER_ATTRIBUTE) User user,
                           HttpServletRequest req) {

        Ad ad = new Ad();
        ad.setAdStatus(true);
        ad.setAdTitle(title);
        ad.setAdDescription(description);
        if (adService.createAd(user, ad, file)) {
            req.getSession().setAttribute("messageSuccess", StringUtil.MESSAGE_SUCCESS_AD_CREATE);
            return "redirect:/";
        } else {
            req.getSession().setAttribute("message", StringUtil.MESSAGE_ERROR_AD_CREATE);
            return "redirect:toCreateAd";
        }
    }

    @RequestMapping(value = "toEditAd/{adId}", method = RequestMethod.GET)
    public String toEditAd(@PathVariable("adId") long id, @ModelAttribute(StringUtil.USER_ATTRIBUTE) User user,
                           Model model, HttpServletRequest req) {
        Ad ad = adService.getById(id);
        model.addAttribute("ad", ad);
        User userAttr = (User) req.getSession().getAttribute(StringUtil.USER_ATTRIBUTE);
        model.addAttribute(StringUtil.USER_REQUEST_ATTRIBUTE, userAttr == null ? null : userAttr.getUserId());
        return "updateAd";
    }

    @RequestMapping(value = "/toEditAd/editAd/{adId}", method = RequestMethod.POST)
    public String editAd(@RequestParam(value = "title") String title,
                         @RequestParam(value = "description") String description,
                         @RequestParam(value = "image") MultipartFile file,
                         @ModelAttribute(StringUtil.USER_ATTRIBUTE) User user,
                         @PathVariable("adId") long id,
                         HttpServletRequest req) {

        Ad ad = adService.getById(id);
        ad.setAdStatus(true);
        ad.setAdTitle(title);
        ad.setAdDescription(description);
        if (adService.updateAd(ad, file)) {
            req.getSession().setAttribute("messageSuccess", StringUtil.MESSAGE_SUCCESS_AD_UPDATE);
            return "redirect:/ads/{adId}";
        } else {
            req.getSession().setAttribute("message", StringUtil.MESSAGE_ERROR_AD_UPDATE);
            return "redirect:/toEditAd/editAd/{adId}";
        }
    }

    @RequestMapping(value = "delete/{adId}", method = RequestMethod.POST)
    public String deleteAd(@PathVariable("adId") long id,
                           HttpServletRequest req) {
        Ad ad = adService.getById(id);
        if (adService.setInactive(ad)) {
            req.getSession().setAttribute("messageSuccess", StringUtil.MESSAGE_SUCCESS_DELETE);
            return "redirect:/";
        } else {
            req.getSession().setAttribute("message", StringUtil.MESSAGE_ERROR_DELETE);
            return "redirect:ads/{adId}";
        }
    }

    @RequestMapping(value = "hideMyAds")
    public String hideMyAds(@ModelAttribute(StringUtil.USER_ATTRIBUTE) User user, Model model,
                            HttpServletRequest req) {
        req.getSession().setAttribute("hidden", false);
        List<Ad> allAds = adService.allAds();
        List<Ad> hideMyAds = allAds.stream().filter(ad -> ad.getUser().getUserId() != user.getUserId()).sorted(Comparator.comparing(Ad::getAdId).reversed()).collect(Collectors.toList());
        User userAttr = (User) req.getSession().getAttribute(StringUtil.USER_ATTRIBUTE);
        model.addAttribute(StringUtil.USER_REQUEST_ATTRIBUTE, userAttr == null ? null : userAttr.getUserId());
        model.addAttribute("adList", hideMyAds);
        req.getSession().setAttribute("hidden", true);
        return "mainPage";
    }

    @RequestMapping(value = "showAll")
    public String showAll(HttpServletRequest req) {
        req.getSession().setAttribute("hidden", false);
        return "redirect:/";
    }

}
