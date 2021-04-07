/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package users.dto;

import java.util.Date;



/**
 *
 * @author tuana
 */
public class commentDTO {
    private String commentID, userID,productID,content,fullName;
    private Date commentDate;

    public commentDTO() {
    }

    public commentDTO(String commentID, String userID, String productID, String content, Date commentDate) {
        this.commentID = commentID;
        this.userID = userID;
        this.productID = productID;
        this.content = content;
        this.commentDate = commentDate;
    }

    public commentDTO(String commentID, String userID, String productID, String content, String fullName) {
        this.commentID = commentID;
        this.userID = userID;
        this.productID = productID;
        this.content = content;
        this.fullName = fullName;
    }

    public commentDTO(String commentID, String userID, String productID, String content, String fullName, Date commentDate) {
        this.commentID = commentID;
        this.userID = userID;
        this.productID = productID;
        this.content = content;
        this.fullName = fullName;
        this.commentDate = commentDate;
    }
    
    

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    
    
}
