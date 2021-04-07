/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import admin.dtos.RoleDTO;
import utils.DBConnect;
import admin.dtos.UsersDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author DELL
 */
public class LoginDao implements Serializable {

    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;

    private void closeConnection() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (conn != null) {
                conn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String checkLogin(String userName, String password) throws Exception {
        String role = "failed";
        String roleID = "";
        try {
            conn = DBConnect.makeConnection();
            String slqGetRoleID = "SELECT roleID\n"
                    + "FROM Users\n"
                    + "WHERE userID=? and password=?";
            preStm = conn.prepareStatement(slqGetRoleID);
            preStm.setString(1, userName);
            preStm.setString(2, password);
            rs = preStm.executeQuery();
            if (rs.next()) {
                roleID = rs.getString("roleID");
            }

            String slqGetRole = "SELECT roleName\n"
                    + "FROM RoleUser\n"
                    + "WHERE roleID=?";
            preStm = conn.prepareStatement(slqGetRole);
            preStm.setString(1, roleID);
            rs = preStm.executeQuery();
            if (rs.next()) {
                role = rs.getString("roleName");
            }
        } finally {
            closeConnection();
        }
        return role;
    }

    public boolean checkStatusIsDelete(String userID, String password) throws Exception {
        String sql = "";
        try {
            sql = "SELECT statusIsDelete\n"
                    + "FROM Users\n"
                    + "WHERE userID=? and password=?";
            conn = DBConnect.makeConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, userID);
                preStm.setString(2, password);
                rs = preStm.executeQuery();
                if (rs.next()) {
                    String statusIsDelete = rs.getString("statusIsDelete");
                    if (statusIsDelete.equals("0")) {
                        return false;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return true;
    }

  
    
    public UsersDTO getProfile(String username, String password) throws Exception {
        UsersDTO accdto = null;
        String sql = "";
        try {
            conn = DBConnect.makeConnection();
            if (conn != null) {
                sql = "SELECT fullName, email, phone, address,roleID,statusIsDelete\n"
                        + "FROM Users\n"
                        + "WHERE userID=? and password=?";
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
                preStm.setString(2, password);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    String fullname = rs.getString("fullName");
                    String email = rs.getString("email");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String roleID=rs.getString("roleID");
                    boolean statusIsDelete=rs.getBoolean("statusIsDelete");
                    RoleDTO role=new RoleDTO();
                    role.setRoleID(roleID);
                    accdto = new UsersDTO(username, password, fullname, email, phone, address, role,statusIsDelete);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return accdto;
    }

    public boolean changeProfile(String fullname, String email, String phone, String address, String userID) throws Exception {
        boolean check = false;
        String sql = "";
        try {

            sql = "UPDATE Users\n"
                    + "SET fullName=?,email=?,phone=?,address=?\n"
                    + "WHERE userID=?";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, fullname);
            preStm.setString(2, email);
            preStm.setString(3, phone);
            preStm.setString(4, address);
            preStm.setString(5, userID);
            check = preStm.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean checkPassword(String username, String password) throws Exception {
        String sql = "";
        try {
            sql = "SELECT password\n"
                    + "FROM Users\n"
                    + "WHERE userID=?";
            conn = DBConnect.makeConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, username);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    String passwordData = rs.getString("password");
                    if (passwordData.equals(password)) {
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return false;
    }

    public boolean changePassword(String username, String password) throws Exception {
        String sql = "";
        boolean check = false;
        try {
            sql = "UPDATE Users\n"
                    + "SET password=?\n"
                    + "WHERE userID=?";
            conn = DBConnect.makeConnection();
            if (conn != null) {
                preStm = conn.prepareStatement(sql);
                preStm.setString(1, password);
                preStm.setString(2, username);
                check = preStm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            closeConnection();
        }
        return check;
    }

}
