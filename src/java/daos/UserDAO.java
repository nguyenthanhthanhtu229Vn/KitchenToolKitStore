/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import users.dto.commentDTO;
import users.dto.itemDTO;
import users.dto.orderDTO;
import users.dto.productDTO;
import users.dto.userDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import utils.DBConnect;

/**
 *
 * @author ASUS
 */
public class UserDAO {

    static Connection conn;
    static PreparedStatement preStm;
    static ResultSet rs;

    public UserDAO() {
    }

    private static void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public List<productDTO> hotProduct() throws Exception {
        List<productDTO> result = new ArrayList<>();
        HashMap<String, productDTO> test = new HashMap<>();
        String productID, userID, itemsID, productName, productImgID, productURLImg, productDetailID, productDescription;
        int price;
        productDTO dto = null;
        String sql = "select top(7) p.productID,userID,itemsID,productName,productImgID,productURLImg, d.productDecription, d.prize, d.productDetailID\n"
                + "                from  Product p join  ProductImg i on p.ProductID = i.ProductID\n"
                + "                join  ProductDetail d on d.ProductID = p.productID where d.quantity>0 and d.statusIsDelete='true' order by productID desc ";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                productID = rs.getString("productID");
                userID = rs.getString("userID");
                itemsID = rs.getString("itemsID");
                productName = rs.getString("productName");
                productImgID = rs.getString("productImgID");
                productURLImg = rs.getString("productURLImg");
                price = rs.getInt("prize");
                productDetailID = rs.getString("productDetailID");
                productDescription = rs.getString("productDecription");
                if (!test.containsKey(productID)) {
                    dto = new productDTO(productID, userID, itemsID, productName, productImgID, productURLImg, productDescription, price, productDetailID);
                    result.add(dto);
                    test.put(productID, dto);
                }
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<productDTO> latestProduct() throws Exception {
        List<productDTO> result = new ArrayList<>();
        HashMap<String, productDTO> test = new HashMap<>();
        String productID, userID, itemsID, productName, productImgID, productURLImg, productDetailID;
        int price;
        productDTO dto = null;
        String sql = "select p.productID,userID,itemsID,productName,productImgID,productURLImg, d.prize, d.productDetailID\n"
                + "                from  Product p join  ProductImg i on p.ProductID = i.ProductID\n"
                + "                join  ProductDetail d on d.ProductID = p.productID where d.quantity>0 and d.statusIsDelete='true' order by productID desc ";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                productID = rs.getString("productID");
                userID = rs.getString("userID");
                itemsID = rs.getString("itemsID");
                productName = rs.getString("productName");
                productImgID = rs.getString("productImgID");
                productURLImg = rs.getString("productURLImg");
                price = rs.getInt("prize");
                productDetailID = rs.getString("productDetailID");
                if (!test.containsKey(productID)) {
                    dto = new productDTO(productID, userID, itemsID, productName, productImgID, productURLImg, price, productDetailID);
                    result.add(dto);
                    test.put(productID, dto);
                }
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<productDTO> loadAllProduct() throws Exception {
        List<productDTO> result = new ArrayList<>();
        HashMap<String, productDTO> test = new HashMap<>();
        String productID, userID, itemsID, productName, productImgID, productURLImg, productDetailID;
        int price;
        productDTO dto = null;
        String sql = "select p.productID,userID,itemsID,productName,productImgID,productURLImg, d.prize, d.productDetailID \n"
                + "from  Product p join  ProductImg i on p.ProductID = i.ProductID \n"
                + "join  ProductDetail d on d.ProductID = p.productID where d.quantity>0 and d.statusIsDelete='true'";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                productID = rs.getString("productID");
                userID = rs.getString("userID");
                itemsID = rs.getString("itemsID");
                productName = rs.getString("productName");
                productImgID = rs.getString("productImgID");
                productURLImg = rs.getString("productURLImg");
                price = rs.getInt("prize");
                productDetailID = rs.getString("productDetailID");
                if (!test.containsKey(productID)) {
                    dto = new productDTO(productID, userID, itemsID, productName, productImgID, productURLImg, price, productDetailID);
                    result.add(dto);
                    test.put(productID, dto);
                }
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<productDTO> loadProductDesc() throws Exception {
        List<productDTO> result = new ArrayList<>();
        HashMap<String, productDTO> test = new HashMap<>();
        String productID, userID, itemsID, productName, productImgID, productURLImg, productDetailID;
        int price;
        productDTO dto = null;
        String sql = "select  p.productID,userID,itemsID,productName,productImgID,productURLImg, d.prize, d.productDetailID\n"
                + "                from  Product p join  ProductImg i on p.ProductID = i.ProductID\n"
                + "                join  ProductDetail d on d.ProductID = p.productID where d.quantity>0 and d.statusIsDelete='true' order by d.prize desc";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                productID = rs.getString("productID");
                userID = rs.getString("userID");
                itemsID = rs.getString("itemsID");
                productName = rs.getString("productName");
                productImgID = rs.getString("productImgID");
                productURLImg = rs.getString("productURLImg");
                price = rs.getInt("prize");
                productDetailID = rs.getString("productDetailID");
                if (!test.containsKey(productID)) {
                    dto = new productDTO(productID, userID, itemsID, productName, productImgID, productURLImg, price, productDetailID);
                    result.add(dto);
                    test.put(productID, dto);
                }
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<productDTO> loadProductAsc() throws Exception {
        List<productDTO> result = new ArrayList<>();
        HashMap<String, productDTO> test = new HashMap<>();
        String productID, userID, itemsID, productName, productImgID, productURLImg, productDetailID;
        int price;
        productDTO dto = null;
        String sql = "select  p.productID,userID,itemsID,productName,productImgID,productURLImg, d.prize, d.productDetailID\n"
                + "                from  Product p join  ProductImg i on p.ProductID = i.ProductID\n"
                + "                join  ProductDetail d on d.ProductID = p.productID where d.quantity>0 and d.statusIsDelete='true' order by d.prize asc";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                productID = rs.getString("productID");
                userID = rs.getString("userID");
                itemsID = rs.getString("itemsID");
                productName = rs.getString("productName");
                productImgID = rs.getString("productImgID");
                productURLImg = rs.getString("productURLImg");
                price = rs.getInt("prize");
                productDetailID = rs.getString("productDetailID");
                if (!test.containsKey(productID)) {
                    dto = new productDTO(productID, userID, itemsID, productName, productImgID, productURLImg, price, productDetailID);
                    result.add(dto);
                    test.put(productID, dto);
                }
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<productDTO> findProductID(String productID) throws Exception {
        List<productDTO> result = new ArrayList<>();
        productDTO dto = null;
        String productName, productURLImg, productDetailID;
        String size, brand, productDescription, itemsName;
        boolean statusIsDelete;
        int price;
        String sql = "select productName,productURLImg, d.prize , it.itemsName,d.productDetailID ,d.brand,d.productDecription,d.quantity,d.size,d.statusIsDelete\n"
                + "from  Product p join  ProductImg i on p.ProductID = i.ProductID \n"
                + "join  ProductDetail d on d.ProductID = p.productID join Items it on p.itemsID = it.itemsID\n"
                + "where p.productID = ? and d.quantity>0 and d.statusIsDelete='true'";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, productID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                productName = rs.getString("productName");
                productURLImg = rs.getString("productURLImg");
                productDetailID = rs.getString("productDetailID");
                size = rs.getString("size");
                brand = rs.getString("brand");
                productDescription = rs.getString("productDecription");
                itemsName = rs.getString("itemsName");
                price = rs.getInt("prize");
                statusIsDelete = rs.getBoolean("statusIsDelete");

                dto = new productDTO(productID, productName, productDetailID, productURLImg, size, brand, productDescription, itemsName, price, statusIsDelete);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;

    }

    public List<productDTO> findProductSize(String productID, String productDetailID) throws Exception {
        List<productDTO> result = new ArrayList<>();
        productDTO dto = null;
        String productName, productURLImg;
        String size, brand, productDescription, itemsName;
        boolean statusIsDelete;
        int price;
        String sql = "select productName,productURLImg, d.prize , it.itemsName,d.productDetailID ,d.brand,d.productDecription,d.quantity,d.size,d.statusIsDelete\n"
                + "from  Product p join  ProductImg i on p.ProductID = i.ProductID \n"
                + "join  ProductDetail d on d.ProductID = p.productID join Items it on p.itemsID = it.itemsID\n"
                + "where p.productID = ? and d.quantity>0 and d.productDetailID =? and d.statusIsDelete='true'";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, productID);
            preStm.setString(2, productDetailID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                productName = rs.getString("productName");
                productURLImg = rs.getString("productURLImg");
                productDetailID = rs.getString("productDetailID");
                size = rs.getString("size");
                brand = rs.getString("brand");
                productDescription = rs.getString("productDecription");
                itemsName = rs.getString("itemsName");
                price = rs.getInt("prize");
                statusIsDelete = rs.getBoolean("statusIsDelete");

                dto = new productDTO(productID, productName, productDetailID, productURLImg, size, brand, productDescription, itemsName, price, statusIsDelete);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;

    }

    public List<itemDTO> listItems() throws Exception {
        List<itemDTO> result = new ArrayList<>();
        String sql = "Select * from Items";
        String itemsID, itemsName, itemsImg;
        itemDTO dto = null;
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                itemsID = rs.getString("itemsID");
                itemsName = rs.getString("itemsName");
                itemsImg = rs.getString("itemsImg");
                dto = new itemDTO(itemsID, itemsName, itemsImg);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }

        return result;
    }

    public List<productDTO> findByProductName(String productName) throws Exception {
        List<productDTO> result = new ArrayList<>();
        HashMap<String, productDTO> test = new HashMap<>();
        String productID, userID, itemsID, productImgID, productURLImg, productDetailID;
        int price;
        productDTO dto = null;
        String sql = "select p.productID,userID,itemsID,productName,productImgID,productURLImg, d.prize, d.productDetailID \n"
                + "from  Product p join  ProductImg i on p.ProductID = i.ProductID \n"
                + "join  ProductDetail d on d.ProductID = p.productID \n"
                + "Where productName like ? and d.quantity>0 and d.statusIsDelete='true'";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, "%" + productName + "%");
            rs = preStm.executeQuery();
            while (rs.next()) {
                productID = rs.getString("productID");
                userID = rs.getString("userID");
                itemsID = rs.getString("itemsID");
                productName = rs.getString("productName");
                productImgID = rs.getString("productImgID");
                productURLImg = rs.getString("productURLImg");
                price = rs.getInt("prize");
                productDetailID = rs.getString("productDetailID");

                if (!test.containsKey(productID)) {
                    test.put(productID, dto);
                    dto = new productDTO(productID, userID, itemsID, productName, productImgID, productURLImg, price, productDetailID);
                    result.add(dto);
                }
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public String findOrderID() throws Exception {
        String sql = "select MAX(orderID) as 'orderID'  from Orders";
        String orderID = "";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                orderID = rs.getString("orderID");
            }
        } finally {
            closeConnection();
        }
        return orderID;
    }

    public String findCommentID() throws Exception {

        String commentID = null;
        try {
            String sql = "select MAX(commentID) as 'commentID'  from Comment";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                commentID = rs.getString("commentID");
            }
        } finally {
            closeConnection();
        }
        return commentID;
    }

    public String findOrderDetailID() throws Exception {
        String sql = "Select MAX(orderDetailID) as 'orderDetailID' from OrderDetail";
        String orderDetailID = null;
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                orderDetailID = rs.getString("orderDetailID");
            }
        } finally {
            closeConnection();
        }
        return orderDetailID;
    }

    public boolean insertOrder(orderDTO dto) throws Exception {
        boolean check = false;
        String sql = "insert into Orders values(?,?,?,?,?,?,?)";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getOrderID());
            preStm.setString(2, dto.getUserID());
            preStm.setTimestamp(3, (Timestamp) dto.getOrderDate());
            preStm.setString(4, dto.getShipAddress());
            preStm.setInt(5, dto.getPhoneNumber());
            preStm.setFloat(6, dto.getTotalPrice());
            preStm.setBoolean(7, dto.isStatus());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insertOrderDetail(orderDTO dto) throws Exception {
        boolean check = false;
        String sql = "insert into OrderDetail values(?,?,?,?,?)";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getOrderDetailID());
            preStm.setString(2, dto.getOrderID());
            preStm.setString(3, dto.getProductDetailID());
            preStm.setInt(4, dto.getQuantity());
            preStm.setFloat(5, dto.getUnitPrice());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public userDTO findUser(String userID) throws Exception {
        userDTO dto = null;
        String sql = "Select * from Users where userID = ?";
        String fullName, email, address;
        int phone;
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                fullName = rs.getString("fullName");
                email = rs.getString("email");
                phone = rs.getInt("phone");
                address = rs.getString("address");
                dto = new userDTO(userID, fullName, email, phone, address);
            }

        } finally {
            closeConnection();
        }
        return dto;
    }

    public String getAutoID(String id) throws Exception {

        String oldString[];
        String finalResult = "";
        oldString = id.split("-");
        String firstString = oldString[0];
        int num = Integer.parseInt(oldString[1]) + 1;

        String numFormat = num + "";
        int lenNum = 3;
        int lenZero = lenNum - numFormat.length();

        for (int i = 0; i < lenZero; i++) {
            numFormat = "0" + numFormat;
        }

        finalResult = firstString + "-" + numFormat;

        return finalResult;

    }

    public List<orderDTO> getAllOrder(String userID) throws Exception {
        String sql = "SELECT o.orderID ,od.orderDetailID, o.orderDate ,o.shipAddress,o.userID,o.totalPrice, o.phoneNumber,o.status, od.productDetailID,\n"
                + "od.unitPrice,od.quantity,i.productURLImg,p.productName\n"
                + "From Product p Join ProductDetail pd on p.productID= pd.productID join OrderDetail od on od.productDetailID = pd.productDetailID\n"
                + "join Orders o on o.orderID = od.orderID join Users u on o.userID = u.userID join ProductImg i on i.productID = p.productID\n"
                + "where o.userID =? ORDER BY o.orderDate desc";
        orderDTO dto = null;
        List<orderDTO> listOrder = new ArrayList<>();
        String orderID;
        Date orderDate;
        String shipAddress;
        int phoneNumber;
        float totalPrice;
        boolean status;
        String urlImg;
        String productName;
        float unitPrice;
        int quantity;
        HashMap<String, orderDTO> test = new HashMap<>();
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                orderID = rs.getString("orderID");

                totalPrice = rs.getFloat("totalPrice");

                urlImg = rs.getString("productURLImg");
                productName = rs.getString("productName");

                if (!test.containsKey(orderID)) {
                    dto = new orderDTO(orderID, totalPrice, urlImg, productName);
                    dto.setOrderDate(rs.getTimestamp("orderDate"));
                    dto.setStatus(rs.getBoolean("status"));
                    listOrder.add(dto);
                    test.put(orderID, dto);
                }

            }
        } finally {
            closeConnection();
        }
        return listOrder;
    }

    public List<orderDTO> getOrderDetail(String userID, String orderID) throws Exception {
        String sql = "SELECT o.orderID ,od.orderDetailID, u.fullName, o.orderDate ,o.shipAddress,o.userID,o.totalPrice, o.phoneNumber,o.status, od.productDetailID,\n"
                + "pd.size,od.unitPrice,od.quantity,i.productURLImg,p.productName\n"
                + "From Product p Join ProductDetail pd on p.productID= pd.productID join OrderDetail od on od.productDetailID = pd.productDetailID\n"
                + "join Orders o on o.orderID = od.orderID join Users u on o.userID = u.userID join ProductImg i on i.productID = p.productID\n"
                + "where o.userID =? and o.orderID = ?";
        orderDTO dto = null;
        List<orderDTO> listOrder = new ArrayList<>();
        Date orderDate;
        String shipAddress;
        int phoneNumber;
        float totalPrice;
        boolean status;
        String urlImg;
        String productName;
        float unitPrice;
        int quantity;
        String fullName;
        String size;
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, userID);
            preStm.setString(2, orderID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                orderID = rs.getString("orderID");
                orderDate = rs.getDate("orderDate");
                shipAddress = rs.getString("shipAddress");
                phoneNumber = rs.getInt("phoneNumber");
                totalPrice = rs.getFloat("totalPrice");
                status = rs.getBoolean("status");
                urlImg = rs.getString("productURLImg");
                productName = rs.getString("productName");
                unitPrice = rs.getFloat("unitPrice");
                quantity = rs.getInt("quantity");
                fullName = rs.getString("fullName");
                size = rs.getString("size");
                dto = new orderDTO(orderID, userID, orderDate, shipAddress, phoneNumber, totalPrice, status, urlImg, productName, unitPrice, quantity, fullName);
                dto.setSize(size);
                listOrder.add(dto);

            }
        } finally {
            closeConnection();
        }
        return listOrder;
    }

    public List<commentDTO> loadAllComment(String productID) throws Exception {
        List<commentDTO> listComment = new ArrayList<>();
        commentDTO dto = null;
        String commentID, userID, content, fullName;
        Date commentDate;
        String sql = "select u.fullName , c.userID, c.productID,c.commentID, c.content,c.commentDate from Comment c join Users u on c.userID = u.userID join Product p on p.productID = c.productID \n"
                + "where c.productID = ? order by c.commentDate desc";
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, productID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                commentID = rs.getString("commentID");
                userID = rs.getString("userID");
                content = rs.getString("content");
                fullName = rs.getString("fullName");
                dto = new commentDTO(commentID, userID, productID, content, fullName);
                dto.setCommentDate(rs.getTimestamp("commentDate"));
                listComment.add(dto);
            }
        } finally {
            closeConnection();
        }
        return listComment;
    }

    public boolean insertComment(commentDTO dto) throws Exception {
        boolean check = false;

        try {
            String sql = "Insert into Comment values(?,?,?,?,?,?)";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, dto.getCommentID());
            preStm.setString(2, dto.getUserID());
            preStm.setString(3, dto.getProductID());
            preStm.setString(4, dto.getContent());
            preStm.setTimestamp(5, (Timestamp) dto.getCommentDate());
            preStm.setBoolean(6, true);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean setQuantity(String productDetailID, int quantity) throws Exception {
        String sql = "update ProductDetail set quantity = ? where productDetailID =?";
        boolean check = false;
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setInt(1, quantity);
            preStm.setString(2, productDetailID);
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public int getQuantity(String productDetailID) throws Exception {
        String sql = "select quantity from ProductDetail where productDetailID =?";
        int quantity = 0;
        try {
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, productDetailID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                quantity = rs.getInt("quantity");
            }
        } finally {
            closeConnection();
        }
        return quantity;
    }

    public static void main(String[] args) throws Exception {

    }
}
