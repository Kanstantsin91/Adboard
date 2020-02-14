package com.services;

import com.dao.AdDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.pojo.Ad;
import com.pojo.User;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Component("adService")
public class AdService {

    public AdService() {
    }

    @Autowired
    AdDao adDao;

    public List<Ad> allAds() {
        return adDao.getAll();
    }

    public Ad getById(long adId) {
        return adDao.gedAd(adId);
    }

    public boolean createAd(User user, Ad ad, MultipartFile file) {
        user.addAd(ad);
        try {
            return adDao.saveAd(ad, file);
        } catch (Exception ex) {
            ex.getStackTrace();
            return false;
        }
    }

    public boolean updateAd(Ad ad, MultipartFile file) {
        try {
            return adDao.updateAd(ad, file);
        } catch (Exception ex) {
            ex.getStackTrace();
            return false;
        }
    }

    public boolean setInactive(Ad ad) {
        ad.setAdStatus(false);
        try {
            adDao.softDelete(ad);
            return true;
        } catch (Exception ex) {
            ex.getStackTrace();
            return false;
        }
    }
}
