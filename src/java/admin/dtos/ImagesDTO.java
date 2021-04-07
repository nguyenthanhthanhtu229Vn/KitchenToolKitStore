/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.dtos;

import java.io.Serializable;

/**
 *
 * @author ASUS
 */
public class ImagesDTO implements Serializable{
    private String productImgID,productURLImg;
    private ProductDTO product;

    public ImagesDTO() {
    }

    public ImagesDTO(String productImgID, String productURLImg, ProductDTO product) {
        this.productImgID = productImgID;
        this.productURLImg = productURLImg;
        this.product = product;
    }

    public String getProductImgID() {
        return productImgID;
    }

    public void setProductImgID(String productImgID) {
        this.productImgID = productImgID;
    }

    public String getProductURLImg() {
        return productURLImg;
    }

    public void setProductURLImg(String productURLImg) {
        this.productURLImg = productURLImg;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }
    
}
