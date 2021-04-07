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
public class ItemsDTO implements Serializable{
    private String itemsID, itemsName,itemsImg;

    public ItemsDTO() {
    }

    public ItemsDTO(String itemsID, String itemsName, String itemsImg) {
        this.itemsID = itemsID;
        this.itemsName = itemsName;
        this.itemsImg = itemsImg;
    }

    public String getItemsID() {
        return itemsID;
    }

    public void setItemsID(String itemsID) {
        this.itemsID = itemsID;
    }

    public String getItemsName() {
        return itemsName;
    }

    public void setItemsName(String itemsName) {
        this.itemsName = itemsName;
    }

    public String getItemsImg() {
        return itemsImg;
    }

    public void setItemsImg(String itemsImg) {
        this.itemsImg = itemsImg;
    }
    
}
