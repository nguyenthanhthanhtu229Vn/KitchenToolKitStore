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
public class ProductDTO implements Serializable{
    private String productID;
    private UsersDTO users;
    private ItemsDTO items;
    private String productName;

    public ProductDTO() {
    }

    public ProductDTO(String productID, ItemsDTO items, String productName) {
        this.productID = productID;
        this.items = items;
        this.productName = productName;
    }

    public ProductDTO(String productID, UsersDTO users, ItemsDTO items, String productName) {
        this.productID = productID;
        this.users = users;
        this.items = items;
        this.productName = productName;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public UsersDTO getUsers() {
        return users;
    }

    public void setUsers(UsersDTO users) {
        this.users = users;
    }

    public ItemsDTO getItems() {
        return items;
    }

    public void setItems(ItemsDTO items) {
        this.items = items;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }
    
}
