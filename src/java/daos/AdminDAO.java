/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import admin.dtos.ImagesDTO;
import admin.dtos.ItemsDTO;
import admin.dtos.OrderDTO;
import admin.dtos.OrderDetailDTO;
import admin.dtos.ProductDTO;
import admin.dtos.ProductDetailDTO;
import admin.dtos.UsersDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import org.apache.catalina.User;
import utils.DBConnect;

/**
 *
 * @author ASUS
 */
public class AdminDAO implements Serializable {

    private ResultSet rs;
    private PreparedStatement preStm;
    private Connection conn;

    public AdminDAO() {

    }

    public void closeConnection() throws Exception {
        if (conn != null) {
            conn.close();
        }
        if (rs != null) {
            rs.close();
        }
        if (preStm != null) {
            preStm.close();
        }
    }

    public List<OrderDetailDTO> loadQuantiyChart() throws Exception{
        List<OrderDetailDTO> list=new ArrayList<>();
        
        try{
            String sql="SELECT SUM(od.quantity) AS 'quantityChart' ,od.productDetailID From Orders o JOIN OrderDetail od On o.orderID=od.orderID Where o.orderDate > DATEADD(month, -1, GETDATE()) GROUP BY od.productDetailID";
            conn=DBConnect.makeConnection();
            preStm=conn.prepareStatement(sql);
            rs=preStm.executeQuery();
            while(rs.next()){
                ProductDetailDTO dtoDetail=new ProductDetailDTO();
                dtoDetail.setProductDetailID(rs.getString("productDetailID"));
                OrderDetailDTO dto=new OrderDetailDTO();
                dto.setQuantity(rs.getInt("quantityChart"));
                dto.setProductDetail(dtoDetail);
                list.add(dto);
            }
        }
        finally{
            closeConnection();
        }
        return list;
    }
    
    public List<ProductDetailDTO> showProductNameChart() throws Exception{
        List<ProductDetailDTO> listProDetail=new ArrayList<>();
        try{
            String sql="SELECT p.productName ,pd.productDetailID FROM  ProductDetail pd JOIN Product p On pd.productID=p.productID Where pd.productDetailID In ( SELECT od.productDetailID From Orders o JOIN OrderDetail od On o.orderID=od.orderID Where o.orderDate > DATEADD(month, -1, GETDATE()))";
             conn=DBConnect.makeConnection();
            preStm=conn.prepareStatement(sql);
            rs=preStm.executeQuery();
            while(rs.next()){
                ProductDTO dtoProduct=new ProductDTO();
                dtoProduct.setProductName(rs.getString("productName"));
                ProductDetailDTO dtoProductDetail=new ProductDetailDTO();
                dtoProductDetail.setProductDetailID(rs.getString("productDetailID"));
                dtoProductDetail.setProduct(dtoProduct);
                listProDetail.add(dtoProductDetail);
            }
        }
        finally{
            closeConnection();
        }
        return listProDetail;
    }
    
    
    public List<UsersDTO> showUser() throws Exception {
        List<UsersDTO> result = new ArrayList<>();
        UsersDTO dto;
        String userID, fullName, email, phone, address;
        boolean statusIsDelete;
        try {
            String sql = "Select userID,fullName,email,phone,address,statusIsDelete From Users Where roleID='ROLE2'";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                userID = rs.getString("userID");
                fullName = rs.getString("fullName");
                email = rs.getString("email");
                phone = rs.getString("phone");
                address = rs.getString("address");
                statusIsDelete = rs.getBoolean("statusIsDelete");
                dto = new UsersDTO(userID, fullName, email, phone, address, statusIsDelete);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ProductDetailDTO> showProductInAdmin() throws Exception {
        List<ProductDetailDTO> result = new ArrayList<>();
        ProductDTO dtoProduct;
        String productID, userID, itemsID, productName, productDetailID, size, brand, productDecription;
        float prize;
        int quantity;
        boolean statusIsDelete;
        try {
            String sql = "SELECT p.productID,p.userID,p.itemsID,p.productName,pd.productDetailID,pd.size,pd.brand,pd.productDecription,pd.quantity,pd.statusIsDelete,pd.prize "
                    + "From Product p Join ProductDetail pd on p.productID= pd.productID Where pd.statusIsDelete='true'";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            while (rs.next()) {
                dtoProduct = new ProductDTO();
                dtoProduct.setProductID(rs.getString("productID"));
                dtoProduct.setProductName(rs.getNString("productName"));

                UsersDTO user = new UsersDTO();
                user.setUserID(rs.getString("userID"));
                dtoProduct.setUsers(user);

                ItemsDTO item = new ItemsDTO();
                item.setItemsID(rs.getString("itemsID"));
                dtoProduct.setItems(item);

                ProductDetailDTO proDetail = new ProductDetailDTO();
                proDetail.setProductDetailID(rs.getString("productDetailID"));
                proDetail.setSize(rs.getString("size"));
                proDetail.setBrand(rs.getString("brand"));
                proDetail.setProductDescription(rs.getString("productDecription"));
                proDetail.setPrice(rs.getFloat("prize"));
                proDetail.setQuantity(rs.getInt("quantity"));
                proDetail.setStatusIsDelete(rs.getBoolean("statusIsDelete"));
                proDetail.setProduct(dtoProduct);
                result.add(proDetail);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean blockUser(UsersDTO users) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Users Set statusIsDelete=? Where userID=?";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setBoolean(1, users.isStatusIsDelete());
            preStm.setString(2, users.getUserID());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean deleteProduct(ProductDetailDTO productDetails) throws Exception {
        boolean check = false;
        try {
            String sql = "Update ProductDetail Set statusIsDelete=? Where productDetailID=?";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setBoolean(1, productDetails.isStatusIsDelete());
            preStm.setString(2, productDetails.getProductDetailID());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public String getProductID() throws Exception {
        String result = null;
        try {
            String sql = "SELECT top(1) productID From Product Order by  productID Desc";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("productID");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getProductDetailID() throws Exception {
        String result = null;
        try {
            String sql = "SELECT top(1) productDetailID From ProductDetail Order by  productDetailID Desc";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("productDetailID");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public String getImageID() throws Exception {
        String result = null;
        try {
            String sql = "SELECT  top(1)productImgID From ProductImg Order by  productImgID Desc";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            if (rs.next()) {
                result = rs.getString("productImgID");
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ItemsDTO> showItems() throws Exception {
        List<ItemsDTO> result = null;
        try {
            String sql = "Select itemsID,itemsName,itemsImg From Items";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            rs = preStm.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                ItemsDTO items = new ItemsDTO();
                items.setItemsID(rs.getString("itemsID"));
                items.setItemsName(rs.getString("itemsName"));
                items.setItemsImg(rs.getString("itemsImg"));
                result.add(items);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public boolean addProduct(ProductDTO product) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert Into Product(productID,userID,itemsID,productName) "
                    + "Values(?,?,?,?)";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, product.getProductID());
            preStm.setString(2, product.getUsers().getUserID());
            preStm.setString(3, product.getItems().getItemsID());
            preStm.setString(4, product.getProductName());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean addImageProduct(ImagesDTO image) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert Into ProductImg(productImgID,productID,productURLImg) "
                    + "Values(?,?,?)";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, image.getProductImgID());
            preStm.setString(2, image.getProduct().getProductID());
            preStm.setString(3, image.getProductURLImg());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean addProductDetail(ProductDetailDTO proDetail) throws Exception {
        boolean check = false;
        try {
            String sql = "Insert Into ProductDetail(productDetailID,productID,size,brand,prize,productDecription,quantity,statusIsDelete) "
                    + "Values(?,?,?,?,?,?,?,?)";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, proDetail.getProductDetailID());
            preStm.setString(2, proDetail.getProduct().getProductID());
            preStm.setString(3, proDetail.getSize());
            preStm.setString(4, proDetail.getBrand());
            preStm.setFloat(5, proDetail.getPrice());
            preStm.setString(6, proDetail.getProductDescription());
            preStm.setInt(7, proDetail.getQuantity());
            preStm.setBoolean(8, proDetail.isStatusIsDelete());
            check = preStm.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public List<ProductDetailDTO> showProductDetailByID(String detailID) throws Exception {
        List<ProductDetailDTO> result = new ArrayList<>();
        ProductDTO dtoProduct;
        String productID, userID, itemsID, productName, productDetailID, size, brand, productDecription;
        float prize;
        int quantity;
        boolean statusIsDelete;
        try {
            String sql = "SELECT p.productID,p.userID,p.itemsID,p.productName,pd.productDetailID,pd.size,pd.brand,pd.productDecription,pd.quantity,pd.statusIsDelete,pd.prize "
                    + "From Product p Join ProductDetail pd on p.productID= pd.productID Where pd.statusIsDelete='true' and pd.productDetailID=?";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, detailID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                dtoProduct = new ProductDTO();
                dtoProduct.setProductID(rs.getString("productID"));
                dtoProduct.setProductName(rs.getNString("productName"));

                UsersDTO user = new UsersDTO();
                user.setUserID(rs.getString("userID"));
                dtoProduct.setUsers(user);

                ItemsDTO item = new ItemsDTO();
                item.setItemsID(rs.getString("itemsID"));
                dtoProduct.setItems(item);

                ProductDetailDTO proDetail = new ProductDetailDTO();
                proDetail.setProductDetailID(rs.getString("productDetailID"));
                proDetail.setSize(rs.getString("size"));
                proDetail.setBrand(rs.getString("brand"));
                proDetail.setProductDescription(rs.getString("productDecription"));
                proDetail.setPrice(rs.getFloat("prize"));
                proDetail.setQuantity(rs.getInt("quantity"));
                proDetail.setStatusIsDelete(rs.getBoolean("statusIsDelete"));
                proDetail.setProduct(dtoProduct);
                result.add(proDetail);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public List<ImagesDTO> showImageByID(String productID) throws Exception {
        List<ImagesDTO> result = new ArrayList<>();
        ImagesDTO dtoImages;
        String productImgID, productURL;
        try {
            String sql = "Select productImgID, productID, productURLImg From ProductImg Where productID=?";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, productID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO();
                product.setProductID(rs.getString("productID"));
                dtoImages = new ImagesDTO();
                dtoImages.setProductImgID(rs.getString("productImgID"));
                dtoImages.setProductURLImg(rs.getString("productURLImg"));
                dtoImages.setProduct(product);
                result.add(dtoImages);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public ProductDetailDTO showProductDetailByPrimaryKey(String productDetailID) throws Exception {
        ProductDetailDTO productDetails = null;
        try {
            String sql = "SELECT p.productID,p.userID,p.itemsID,p.productName,pd.productDetailID,pd.size,pd.brand,pd.productDecription,pd.quantity,pd.statusIsDelete,pd.prize "
                    + "From Product p Join ProductDetail pd on p.productID= pd.productID Where pd.statusIsDelete='true' and pd.productDetailID=?";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, productDetailID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                ProductDTO dtoProduct = new ProductDTO();
                dtoProduct.setProductID(rs.getString("productID"));
                dtoProduct.setProductName(rs.getNString("productName"));

                UsersDTO user = new UsersDTO();
                user.setUserID(rs.getString("userID"));
                dtoProduct.setUsers(user);
                productDetails = new ProductDetailDTO();
                ItemsDTO item = new ItemsDTO();
                item.setItemsID(rs.getString("itemsID"));
                dtoProduct.setItems(item);
                productDetails.setProductDetailID(rs.getString("productDetailID"));
                productDetails.setSize(rs.getString("size"));
                productDetails.setBrand(rs.getString("brand"));
                productDetails.setProductDescription(rs.getString("productDecription"));
                productDetails.setPrice(rs.getFloat("prize"));
                productDetails.setQuantity(rs.getInt("quantity"));
                productDetails.setStatusIsDelete(rs.getBoolean("statusIsDelete"));
                productDetails.setProduct(dtoProduct);
            }
        } finally {
            closeConnection();
        }
        return productDetails;
    }

    public boolean updateProdcut(ProductDTO product) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Product Set itemsID=?, productName=? Where productID=?";
            conn=DBConnect.makeConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setString(1, product.getItems().getItemsID());
            preStm.setString(2, product.getProductName());
            preStm.setString(3, product.getProductID());
            check=preStm.executeUpdate()>0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean updateDetailProduct(ProductDetailDTO productDetail) throws Exception{
        boolean check=false;
        try{
            String sql="Update ProductDetail Set size=?,brand=?,prize=?,productDecription=?,quantity=? Where productDetailID=?";
            conn=DBConnect.makeConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setString(1, productDetail.getSize());
            preStm.setString(2, productDetail.getBrand());
            preStm.setFloat(3, productDetail.getPrice());
            preStm.setString(4, productDetail.getProductDescription());
            preStm.setInt(5, productDetail.getQuantity());
            preStm.setString(6, productDetail.getProductDetailID());
            check=preStm.executeUpdate()>0;
        }
        finally{
            closeConnection();
        }
        return check;
    }
    
    public String showItemName(String itemsID) throws Exception{
        String result=null;
        try{
            String sql="Select itemsName From Items Where itemsID=?";
            conn=DBConnect.makeConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setString(1, itemsID);
            rs=preStm.executeQuery();
            if(rs.next()){
                result=rs.getString("itemsName");
            }
        }
        finally{
            closeConnection();
        }
        return result;
    }
    
    public String getItemID(String productID) throws Exception{
        String result=null;
        try{
            String sql="Select itemsID From Product Where productID=?";
            conn=DBConnect.makeConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setString(1, productID);
            rs=preStm.executeQuery();
            if(rs.next()){
                result=rs.getString("itemsID");
            }
        }
        finally{
            closeConnection();
        }
        return result;
    }
    
    public List<ProductDetailDTO> showProductDetailByProductID(String productID) throws Exception {
        List<ProductDetailDTO> result = new ArrayList<>();
        ProductDTO dtoProduct;
        String  userID, itemsID, productName, productDetailID, size, brand, productDecription;
        float prize;
        int quantity;
        boolean statusIsDelete;
        try {
            String sql = "SELECT p.productID,p.userID,p.itemsID,p.productName,pd.productDetailID,pd.size,pd.brand,pd.productDecription,pd.quantity,pd.statusIsDelete,pd.prize "
                    + "From Product p Join ProductDetail pd on p.productID= pd.productID Where pd.statusIsDelete='true' and pd.productID=?";
            conn = DBConnect.makeConnection();
            preStm = conn.prepareStatement(sql);
            preStm.setString(1, productID);
            rs = preStm.executeQuery();
            while (rs.next()) {
                dtoProduct = new ProductDTO();
                dtoProduct.setProductID(rs.getString("productID"));
                dtoProduct.setProductName(rs.getNString("productName"));

                UsersDTO user = new UsersDTO();
                user.setUserID(rs.getString("userID"));
                dtoProduct.setUsers(user);

                ItemsDTO item = new ItemsDTO();
                item.setItemsID(rs.getString("itemsID"));
                dtoProduct.setItems(item);

                ProductDetailDTO proDetail = new ProductDetailDTO();
                proDetail.setProductDetailID(rs.getString("productDetailID"));
                proDetail.setSize(rs.getString("size"));
                proDetail.setBrand(rs.getString("brand"));
                proDetail.setProductDescription(rs.getString("productDecription"));
                proDetail.setPrice(rs.getFloat("prize"));
                proDetail.setQuantity(rs.getInt("quantity"));
                proDetail.setStatusIsDelete(rs.getBoolean("statusIsDelete"));
                proDetail.setProduct(dtoProduct);
                result.add(proDetail);
            }
        } finally {
            closeConnection();
        }
        return result;
    }
    
    
    public List<OrderDTO> showOrder() throws Exception{
        List<OrderDTO> result=new ArrayList<>();
        try{
            String sql="Select o.orderID,o.userID,u.fullName,o.orderDate,o.shipAddress,o.phoneNumber,o.totalPrice,o.status From Orders o JOIN Users u ON o.userID=u.userID ORDER BY o.orderDate desc";
            conn=DBConnect.makeConnection();
            preStm=conn.prepareStatement(sql);
            rs=preStm.executeQuery();
            while(rs.next()){
                UsersDTO user=new UsersDTO();
                user.setUserID(rs.getString("userID"));
                user.setFullname(rs.getString("fullname"));
                
                OrderDTO order=new OrderDTO();
                order.setOrderID(rs.getString("orderID"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setShipAddress(rs.getString("shipAddress"));
                order.setPhoneNumber(rs.getString("phoneNumber"));
                order.setTotalPrice(rs.getFloat("totalPrice"));
                order.setStatus(rs.getBoolean("status"));
                order.setUser(user);
                result.add(order);
            }
        }
        finally{
            closeConnection();
        }
        return result;
    }
    
    public List<OrderDetailDTO> showOrderDetail(String orderID) throws Exception{
        List<OrderDetailDTO>result=new ArrayList<>();
        try{
            String sql="Select orderDetailID,orderID,productDetailID,quantity,unitPrice From OrderDetail Where orderID=?";
            conn=DBConnect.makeConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setString(1, orderID);
            rs=preStm.executeQuery();
            while(rs.next()){
                ProductDetailDTO productDetail=new ProductDetailDTO();
                productDetail.setProductDetailID(rs.getString("productDetailID"));
                OrderDTO order=new OrderDTO();
                order.setOrderID(rs.getString("orderID"));
                OrderDetailDTO orderDetail=new OrderDetailDTO();
                orderDetail.setOrderDetailID(rs.getString("orderDetailID"));
                orderDetail.setQuantity(rs.getInt("quantity"));
                orderDetail.setUnitPrice(rs.getFloat("unitPrice"));
                orderDetail.setOrder(order);
                orderDetail.setProductDetail(productDetail);
                result.add(orderDetail);
            }
        }
        finally{
            closeConnection();
        }
        return result;
    }
    
    public boolean confirmOder(OrderDTO order) throws Exception{
        boolean check=false;
        try{
            String sql="Update Orders Set status=? Where orderID=?";
            conn=DBConnect.makeConnection();
            preStm=conn.prepareStatement(sql);
            preStm.setBoolean(1, order.isStatus());
            preStm.setString(2, order.getOrderID());
            check=preStm.executeUpdate()>0;
        }
        finally{
            closeConnection();
        }
        return check;
    }
}
