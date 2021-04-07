/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import admin.dtos.UsersDTO;
import utils.DBConnect;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class RegistrationDao implements Serializable {

    private Connection conn = null;
    private PreparedStatement preStm = null;
    private ResultSet rs = null;
//    private ArrayList list;

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

    public boolean insertUser(UsersDTO dto) throws Exception {
        boolean check = false;
        String sql = "";
        try {
            sql = "INSERT INTO Users(userID,roleID,password,fullName,email,phone,address,statusIsDelete)\n"
                    + "VALUES(?,?,?,?,?,?,?,?)";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            if (conn != null) {
                preStm.setString(1, dto.getUserID());
                preStm.setString(2, dto.getRole().getRoleID());
                preStm.setString(3, dto.getPassword());
                preStm.setString(4, dto.getFullname());
                preStm.setString(5, dto.getEmail());
                preStm.setString(6, dto.getPhone());
                preStm.setString(7, dto.getAddress());
                preStm.setBoolean(8, dto.isStatusIsDelete());
                check = preStm.executeUpdate() > 0;
            }
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean checkUsername(String userName) throws Exception {
        boolean isExisted = false;
        String userNameData = "";
        String sql = "";

        try {
            sql = "SELECT userID\n"
                    + "FROM Users";
            conn = DBConnect.makeConnection();;
            if (conn != null) {
                preStm = conn.prepareStatement(sql);
                rs = preStm.executeQuery();
                while (rs.next()) {
                    userNameData = rs.getString("userID");
                    if (userName.equals(userNameData)) {
                        isExisted = true;
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            closeConnection();
        }
        return isExisted;
    }
}
