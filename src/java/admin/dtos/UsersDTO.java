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
public class UsersDTO implements Serializable {

    private String userID, password, fullname, email, phone, address;
    private RoleDTO role;
    private boolean  statusIsDelete;

    public UsersDTO() {
    }

    public UsersDTO(String userID, boolean statusIsDelete) {
        this.userID = userID;
        this.statusIsDelete = statusIsDelete;
    }

    public UsersDTO(String userID, String password, String fullname, String email, String phone, String address, RoleDTO role, boolean statusIsDelete) {
        this.userID = userID;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.statusIsDelete = statusIsDelete;
    }

    public UsersDTO(String userID, String password, String fullname, String email, String phone, String address) {
        this.userID = userID;
        this.password = password;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public UsersDTO(String userID, String fullname, String email, String phone, String address, boolean statusIsDelete) {
        this.userID = userID;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.statusIsDelete = statusIsDelete;
    }

    public UsersDTO(String userID, String fullname, String email, String phone, String address) {
        this.userID = userID;
        this.fullname = fullname;
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public RoleDTO getRole() {
        return role;
    }

    public void setRole(RoleDTO role) {
        this.role = role;
    }

    public boolean isStatusIsDelete() {
        return statusIsDelete;
    }

    public void setStatusIsDelete(boolean statusIsDelete) {
        this.statusIsDelete = statusIsDelete;
    }

}
