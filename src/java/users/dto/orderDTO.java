/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users.dto;

import java.io.Serializable;
import java.util.Date;


/**
 *
 * @author tuana
 */
public class orderDTO implements Serializable{
    private String orderID,userID;
    private Date orderDate;
    private String shipAddress;
    private int phoneNumber;
    private float totalPrice;
    private boolean status;
    private String orderDetailID, productDetailID;
    private int quantity;
    private float unitPrice;
    private String urlImg;
    private String productName;
    private String fullName;
    private String size;
    

    public orderDTO(String orderID, String userID, Date orderDate, String shipAddress, int phoneNumber, boolean status) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.shipAddress = shipAddress;
        this.phoneNumber = phoneNumber;
        this.status = status;
        
    }

    public orderDTO(String orderID, String userID, Date orderDate, String shipAddress, int phoneNumber, float totalPrice, boolean status) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.shipAddress = shipAddress;
        this.phoneNumber = phoneNumber;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public orderDTO(String orderID, float totalPrice, String urlImg, String productName) {
        this.orderID = orderID;
        this.totalPrice = totalPrice;
        this.urlImg = urlImg;
        this.productName = productName;
    }
    
    

    public orderDTO(String orderID, String userID, Date orderDate, String shipAddress, int phoneNumber, float totalPrice, boolean status,String urlImg,String productName,float unitPrice,int quantity,String fullName) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderDate = orderDate;
        this.shipAddress = shipAddress;
        this.phoneNumber = phoneNumber;
        this.totalPrice = totalPrice;
        this.status = status;
        this.urlImg = urlImg;
        this.productName = productName;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
        this.fullName = fullName;
    }

    public orderDTO(String orderID, String orderDetailID, String productDetailID, int quantity, float unitPrice) {
        this.orderID = orderID;
        this.orderDetailID = orderDetailID;
        this.productDetailID = productDetailID;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    
    }

    public orderDTO(String orderID, Date orderDate, String shipAddress, int phoneNumber, float totalPrice, String fullName) {
        this.orderID = orderID;
        this.orderDate = orderDate;
        this.shipAddress = shipAddress;
        this.phoneNumber = phoneNumber;
        this.totalPrice = totalPrice;
        this.fullName = fullName;
    }
    
    

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getUrlImg() {
        return urlImg;
    }

    public void setUrlImg(String urlImg) {
        this.urlImg = urlImg;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public String getProductDetailID() {
        return productDetailID;
    }

    public void setProductDetailID(String productDetailID) {
        this.productDetailID = productDetailID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

  

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    
    
}
