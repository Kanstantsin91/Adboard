package com.pojo;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table (name = "ads")
public class Ad implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column (name = "ad_id")
    private long adId;

    @Column (name = "ad_title")
    private String adTitle;

    @Column (name = "ad_desc")
    private String adDescription;

    @Column(name = "ad_status")
    private boolean adStatus;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @Column (name = "image_name" )
    private String imageName;

    public long getAdId() {
        return adId;
    }

    public void setAdId(long adId) {
        this.adId = adId;
    }

    public String getAdTitle() {
        return adTitle;
    }

    public void setAdTitle(String adTitle) {
        this.adTitle = adTitle;
    }

    public String getAdDescription() {
        return adDescription;
    }

    public void setAdDescription(String adDescription) {
        this.adDescription = adDescription;
    }

    public boolean isAdStatus() {
        return adStatus;
    }

    public void setAdStatus(boolean adStatus) {
        this.adStatus = adStatus;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String image) {
        this.imageName = image;
    }

    @Override
    public String toString() {
        return "Ad{" +
                "AdId=" + adId +
                ", AdTitle='" + adTitle + '\'' +
                ", adDescription='" + adDescription + '\'' +
                ", adStatus=" + adStatus +
                ", imageName='" + imageName + '\'' +
                '}';
    }
}
