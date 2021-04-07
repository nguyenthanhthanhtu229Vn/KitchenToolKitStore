/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users.dto;

/**
 *
 * @author tuana
 */
public class itemDTO {
    private String itemsID,itemsName,itemsImg;

    public itemDTO() {
    }

    public itemDTO(String itemsID, String itemsName, String itemsImg) {
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
