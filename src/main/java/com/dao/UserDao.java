package com.dao;

import com.pojo.User;
import com.utils.HibernateUtil;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserDao {

    Transaction transaction;

    public User getByLogin(String login, String password) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<User> query = session.createQuery("from User u where u.login= :login");
            query.setParameter("login", login);
            List<User> users = query.list();
            User user1 = users.get(0);
            if (password.equals(user1.getPassword())) {
                return session.get(User.class, user1.getUserId());
            } else return null;
        } catch (Exception ex) {
            return null;
        }
    }

    public boolean isLoginFree(String login) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Query<User> query = session.createQuery("from User u where u.login= :login");
            query.setParameter("login", login);
            return query.list().isEmpty();
        }
    }

    public User getById(long id) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(User.class, id);
        }
    }

    public boolean saveUser(User user) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction= session.beginTransaction();
            session.save(user);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(User user) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(user);
            transaction.commit();
            return true;
        } catch (Exception ex) {
            if (transaction != null) {
                transaction.rollback();
            }
            ex.printStackTrace();
            return false;
        }
    }


}
