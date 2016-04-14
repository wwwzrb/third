package org.model;

/**
 * Created by wcy on 2016/4/9.
 */
public class product {
    private String id;
    private String productCode;
    private String productName;
    private int prodectSource;
    public void setId(String id){
        this.id=id;
    }

    public String getId() {
        return id;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductName() {
        return productName;
    }

    public int getProdectSource() {
        return prodectSource;
    }

    public void setProdectSource(int prodectSource) {
        this.prodectSource = prodectSource;
    }
}
