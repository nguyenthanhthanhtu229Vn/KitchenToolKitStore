/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin.dtos;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author ASUS
 */
public class OrderDTO implements Serializable{
    private String orderID,shipAddress,phoneNumber;
    private UsersDTO user;
    private Date orderDate;
    private float totalPrice;
    private boolean status;

    public OrderDTO() {
    }

    public OrderDTO(String orderID, boolean status) {
        this.orderID = orderID;
        this.status = status;
    }

    public OrderDTO(String orderID, String shipAddress, String phoneNumber, UsersDTO user, Date orderDate, float totalPrice, boolean status) {
        this.orderID = orderID;
        this.shipAddress = shipAddress;
        this.phoneNumber = phoneNumber;
        this.user = user;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getShipAddress() {
        return shipAddress;
    }

    public void setShipAddress(String shipAddress) {
        this.shipAddress = shipAddress;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public UsersDTO getUser() {
        return user;
    }

    public void setUser(UsersDTO user) {
        this.user = user;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
    
}
