package org.model;

/**
 * Created by wcy on 2016/4/10.
 */
import java.sql.*;
import java.time.DateTimeException;

public class records {
    private String id;
    private String userId;
    private String productId;
    private int number;
    private Timestamp shopDate;

    public void setId(String id) {
        this.id = id;
    }

    public String getId() {
        return id;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserId() {
        return userId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductId() {
        return productId;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getNumber() {
        return number;
    }

    public void setShopDate(Timestamp shopDate) {
        this.shopDate = shopDate;
    }

    public Timestamp getShopDate() {
        return shopDate;
    }
}
