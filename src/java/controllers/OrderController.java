/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.dto.cartObj;
import users.dto.orderDTO;
import users.dto.productDTO;
import users.dto.userDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    private static final String SUCCESS = "orderSuccess.jsp";
    private static final String ERROR = "order.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            UserDAO dao = new UserDAO();
            HttpSession session = request.getSession();
            cartObj shoppingCart = (cartObj) session.getAttribute("CART");

            int quantity;
            String productDetailID;
            int quantityRepo;
            boolean checkQuant = true;
            boolean check = true;
            HashMap<String, String> err = new HashMap<>();
            Iterator<productDTO> numPro = shoppingCart.values().iterator();
            while (numPro.hasNext()) {
                productDTO p = numPro.next();
                String productID = p.getProductID();
                productDetailID = p.getProductDetailID();
                quantity = p.getQuantity();
                int checkQuantity = dao.getQuantity(productDetailID);
                if (quantity > checkQuantity) {
                    shoppingCart.updateCart(productID, checkQuantity);
                    err.put(productID, "This product dosen't have enough quantity, click order now again to buy the remaining number of products");

                    url = "cart.jsp";
                    checkQuant = false;
                }
            }
            int sizeOd = shoppingCart.size();
            int sizeErr = err.size();
            request.setAttribute("ERRORQUANTITY", err);
            request.setAttribute("SIZEOD", sizeOd);
            request.setAttribute("SIZEERR", sizeErr);

//            -----------------------------------
            if (checkQuant) {
                String orderID = dao.findOrderID();
                if (orderID == null) {
                    orderID = "ORDER-000";
                }
                orderID = dao.getAutoID(orderID);
                String userID = (String) session.getAttribute("USERID");
                userDTO usDto = dao.findUser(userID);
                long millis = System.currentTimeMillis();
                Timestamp orderDate = new Timestamp(millis);
                String shipAddress = request.getParameter("txtAddress").trim();
                String phoneString = request.getParameter("txtPhone").trim();
                float totalPrice = (float) session.getAttribute("TOTAL");
                String phoneValidate = "^0[0-9]{9,10}$";
                boolean status = false;
 
                if (shipAddress.length() == 0) {
                    check = false;
                    request.setAttribute("ERRORADDRESS", "Nhập địa chỉ");
                }
                if (phoneString.length() == 0 || !phoneString.matches(phoneValidate)) {
                    check = false;
                    request.setAttribute("ERRORPHONE", "Nhập số điện thoại theo dang [0][x] x is 9 hoăc 10 số.");
                }
                if (check) {
                    int phoneNumber = Integer.parseInt(phoneString);
                    orderDTO orDto = new orderDTO(orderID, userID, orderDate, shipAddress, phoneNumber, totalPrice, status);
                    boolean insert = dao.insertOrder(orDto);
                    if (insert) {
                        String orderDetailID = dao.findOrderDetailID();
                        if (orderDetailID == null) {
                            orderDetailID = "ORDERDETAIL-000";
                        }
                        int unitPrice;
                        Iterator<productDTO> iterator = shoppingCart.values().iterator();
                        while (iterator.hasNext()) {
                            orderDetailID = dao.getAutoID(orderDetailID);
                            productDTO next = iterator.next();
                            productDetailID = next.getProductDetailID();
                            quantity = next.getQuantity();
                            unitPrice = next.getPrice();
                            quantityRepo = dao.getQuantity(productDetailID) - quantity;
                            orDto = new orderDTO(orderID, orderDetailID, productDetailID, quantity, unitPrice);
                            dao.setQuantity(productDetailID, quantityRepo);
                            dao.insertOrderDetail(orDto);
                        }
                        session.removeAttribute("CART");
                        url = SUCCESS;
                    } else {
                        url = ERROR;
                    }
                }
            } else {
                url = "cart.jsp";
            }
        } catch (Exception e) {
            log("ERROR at OrderController " + e.getMessage());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
