/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SHOWPRODUCTINADMIN = "ShowProductInAdminController";
    private static final String SHOWUSERINADMIN = "ShowUserController";
    private static final String BLOCKUSER = "BlockUserController";
    private static final String DELETEPRODUCTINADMIN = "DeleteProductInAdminController";
    private static final String NEXTFORMPRODUCT = "NextFormProductController";
    private static final String ADDNEWPRODUCT = "AddNewProductController";
    private static final String DETAILPRODUCTINADMIN = "DetailProductInAdminController";
    private static final String EDITPRODUCTINADMIN = "EditProductInAdminController";
    private static final String UPDATEPRODUCTINADMIN = "UpdateProductInAdminController";
    private static final String FORMADDSIZEPRODUCTADMIN = "FormAddSizeProductInAdminController";
    private static final String ADDSIZEPRODUCTINADMIN = "AddSizeProductInAdminController";
    private static final String LOGIN = "LoginController";
    private static final String REGISTRATION = "RegistrationController";
    private static final String SHOWORDERINADMIN = "ShowOrderInAdminController";
    private static final String CONFIRMORDERINADMIN = "ConfirmOrderInAdminController";
    private static final String SHOWDETAILORDERINADMIN = "ShowDetailOrderInAdminController";
    private static final String ADD = "AddController";
    private static final String UPDATE = "UpdateController";
    private static final String SEARCH = "SearchController";
    private static final String ORDER = "OrderController";
    private static final String COMMENT = "CommentController";
    private static final String SHOP = "ShopController";
    private static final String LOGOUT = "LogoutController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = SHOP;
        String action = request.getParameter("action");
        HttpSession session=request.getSession();
        String role=(String)session.getAttribute("ROLEID");
        System.out.println(action);
        try {
            if(action==null &&role.equalsIgnoreCase("ROLE1")){
                url=SHOWPRODUCTINADMIN;
            }
            if (action.equals("Block")) {
                url = BLOCKUSER;
            } else if (action.equals("Logout")) {
                url = LOGOUT;
            } else if (action.equals("detailOrderInAdmin")) {
                url = SHOWDETAILORDERINADMIN;
            } else if (action.equals("ConfirmOrder")) {
                url = CONFIRMORDERINADMIN;
            } else if (action.equals("ShowOrderInAdmin")) {
                url = SHOWORDERINADMIN;
            } else if (action.equals("Login")) {
                url = LOGIN;
            } else if (action.equals("Registration")) {
                url = REGISTRATION;
            } else if (action.equals("AddSizeProductInAdmin")) {
                url = ADDSIZEPRODUCTINADMIN;
            } else if (action.equals("FormAddSizeProductInAdmin")) {
                url = FORMADDSIZEPRODUCTADMIN;
            } else if (action.equals("UpdateProductInAdmin")) {
                url = UPDATEPRODUCTINADMIN;
            } else if (action.equals("EditProductInAdmin")) {
                url = EDITPRODUCTINADMIN;
            } else if (action.equals("NextFormProduct")) {
                url = NEXTFORMPRODUCT;
            } else if (action.equals("detailProductInAdmin")) {
                url = DETAILPRODUCTINADMIN;
            } else if (action.equals("AddNewProduct")) {
                url = ADDNEWPRODUCT;
            } else if (action.equals("DeleteProductInAdmin")) {
                url = DELETEPRODUCTINADMIN;
            } else if (action.equals("ShowUserInAdmin")) {
                url = SHOWUSERINADMIN;
            } else if (action.equals("ShowProductInAdmin")) {
                url = SHOWPRODUCTINADMIN;
            } else if (action.equals("Add")) {
                url = ADD;
            } else if (action.equals("edit")) {
                url = UPDATE;
            } else if (action.equals("Search")) {
                url = SEARCH;
            } else if (action.equals("Place Order")) {
                url = ORDER;
            } else if (action.equals("comment")) {
                url = COMMENT;
            }
        } catch (Exception e) {
            log("Error At MainController" + e.getMessage());
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
