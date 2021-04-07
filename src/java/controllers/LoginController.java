/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.LoginDao;
import admin.dtos.UsersDTO;
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
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String ERROR = "errorLoginController.jsp";
    private static final String ADMIN = "ShowProductInAdminController";
    private static final String USER = "ShopController";
    private static final String INVALID = "account.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {

            String userID = request.getParameter("txtUserIDLogin");
            String password = request.getParameter("txtPasswordLogin");
            LoginDao loginDao = new LoginDao();
            String role = loginDao.checkLogin(userID, password);
            if (role.equals("failed")) {
                url = INVALID;
                request.setAttribute("LoginError", "Tài khoản hoặc mật khẩu không hợp lệ");
            } else {
                HttpSession session = request.getSession();

                if (role.equals("ADMIN")) {
                    url = ADMIN;
                    UsersDTO accountProfile = loginDao.getProfile(userID, password);
                    session.setAttribute("USERID", accountProfile.getUserID());
                    session.setAttribute("ROLEID", accountProfile.getRole().getRoleID());
                    session.setAttribute("ACCOUNTLOGIN", accountProfile);
                } else if (role.equals("USER")) {
                    boolean check = loginDao.checkStatusIsDelete(userID, password);
                    if (check) {
                        System.out.println(check);
                        url = USER;
                        UsersDTO accountProfile = loginDao.getProfile(userID, password);
                        session.setAttribute("ACCOUNTLOGIN", accountProfile);
                        session.setAttribute("USERID", accountProfile.getUserID());
                        session.setAttribute("ROLEID", accountProfile.getRole().getRoleID());

                    } else {
                        url = INVALID;
                        request.setAttribute("LoginError", "Tài khoản bị khóa vui lòng liên hệ tới Admin");
                    }
                } else {
                    request.setAttribute("LoginStatus", "Role không hợp lệ!");
                }
            }

        } catch (Exception e) {
            log("ERROR at LoginController" + e.getMessage());
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
