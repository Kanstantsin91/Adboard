package com.dao;

import com.mysql.cj.jdbc.Blob;
import com.utils.HibernateUtil;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import com.pojo.Ad;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;

@Repository
public class AdDao {

    Transaction transaction;

    public List<Ad> getAll() {

        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            Query<Ad> query = session.createQuery("from Ad ad where ad.adStatus= :status");
            query.setParameter("status", true);
            List<Ad> allAds = query.list();
            transaction.commit();
            return allAds;
        } catch (Exception ex) {
            return null;
        }
    }

    public Ad gedAd(long adId) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            return session.get(Ad.class, adId);
        }
    }

    public boolean saveAd(Ad ad, MultipartFile file) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Blob blob = (Blob) Hibernate.getLobCreator(session).createBlob(file.getBytes());
            InputStream inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            inputStream.close();
            outputStream.close();
            ad.setImageName(base64Image);
            transaction = session.beginTransaction();
            session.save(ad);
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

    public boolean updateAd(Ad ad, MultipartFile file) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            Blob blob = (Blob) Hibernate.getLobCreator(session).createBlob(file.getBytes());
            InputStream inputStream = blob.getBinaryStream();
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            byte[] imageBytes = outputStream.toByteArray();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            inputStream.close();
            outputStream.close();
            ad.setImageName(base64Image);
            transaction = session.beginTransaction();
            session.update(ad);
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

    public boolean softDelete (Ad ad) {
        try (Session session = HibernateUtil.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.update(ad);
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
