package com.services;

import com.dao.UserDao;
import com.pojo.User;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    UserDao userDao = new UserDao();

    public User getUserByLogin(String login, String password) {
        return userDao.getByLogin(login, password);
    }

    public User getUserById(long id) {
        return userDao.getById(id);
    }

    public boolean createUser(User user) {
        try {
            return userDao.saveUser(user);
        } catch (Exception ex){
            return false;
        }
    }

    public boolean isLoginFree(String login) {
        return userDao.isLoginFree(login);
    }

    public boolean updateUser(User user) {
        try {
            return userDao.updateUser(user);
        } catch (Exception ex) {
            return false;
        }
    }
}
