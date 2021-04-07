/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users.dto;

import java.io.Serializable;

/**
 *
 * @author tuana
 */
public class productDTO implements Serializable{
    private String productID,userID,itemsID,productName,productImgID,productURLImg;
    private String size, brand, productDescription, itemsName;
    private int price, quantity;
    private boolean statusIsDelete; 
    private String productDetailID;
    public productDTO() {
    }

    public productDTO(String productID, String userID, String itemsID, String productName, String productImgID, String productURLImg, String productDescription, int price, String productDetailID) {
        this.productID = productID;
        this.userID = userID;
        this.itemsID = itemsID;
        this.productName = productName;
        this.productImgID = productImgID;
        this.productURLImg = productURLImg;
        this.productDescription = productDescription;
        this.price = price;
        this.productDetailID = productDetailID;
    }

    public productDTO(String productID, String userID, String itemsID, String productName, String productImgID, String productURLImg, int price, String productDetailID) {
        this.productID = productID;
        this.userID = userID;
        this.itemsID = itemsID;
        this.productName = productName;
        this.productImgID = productImgID;
        this.productURLImg = productURLImg;
        this.price = price;
        this.productDetailID = productDetailID;
    }

    public productDTO(String productID, String productName, String productURLImg, String size, int price, String productDetailID) {
        this.productID = productID;
        this.productName = productName;
        this.productURLImg = productURLImg;
        this.size = size;
        this.price = price;
        this.productDetailID = productDetailID;
    }

    public productDTO(String productID, String productName,String productDetailID , String productURLImg, String size, String brand, String productDescription, String itemsName, int price,boolean statusIsDelete ) {
        this.productID = productID;
        this.productName = productName;
        this.productDetailID = productDetailID;
        this.productURLImg = productURLImg;
        this.size = size;
        this.brand = brand;
        this.productDescription = productDescription;
        this.itemsName = itemsName;
        this.price = price;
        this.statusIsDelete = statusIsDelete;
    }

    public productDTO(String productID, String productName, String productURLImg, int price, String productDetailID,String size) {
        this.productID = productID;
        this.productName = productName;
        this.productURLImg = productURLImg;
        this.price = price;
        this.productDetailID = productDetailID;
        this.quantity =1;
        this.size=size;
    }

    public boolean isStatusIsDelete() {
        return statusIsDelete;
    }

    public void setStatusIsDelete(boolean statusIsDelete) {
        this.statusIsDelete = statusIsDelete;
    }

   
    
    

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public String getItemsName() {
        return itemsName;
    }

    public void setItemsName(String itemsName) {
        this.itemsName = itemsName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

   
   

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getItemsID() {
        return itemsID;
    }

    public void setItemsID(String itemsID) {
        this.itemsID = itemsID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
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

    public String getProductDetailID() {
        return productDetailID;
    }

    public void setProductDetailID(String productDetailID) {
        this.productDetailID = productDetailID;
    }
    
    
}
