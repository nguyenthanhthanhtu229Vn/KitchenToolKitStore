/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.RegistrationDao;
import admin.dtos.RoleDTO;
import admin.dtos.UsersDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "RegistrationController", urlPatterns = {"/RegistrationController"})
public class RegistrationController extends HttpServlet {

    private static final String ERROR = "errorRegistrationController.jsp";
    private static final String SUCCESS = "account.jsp";
    private static final String INVALID = "account.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String userID = request.getParameter("txtUserRegis");
            String password = request.getParameter("txtPasswordRegis");
            String fullName = request.getParameter("txtFullname").trim();
            String email = request.getParameter("txtEmail");
            String phone = request.getParameter("txtPhone");
            String address = request.getParameter("txtAddress");
            String role = "ROLE2";
            RoleDTO roledto = new RoleDTO();
            roledto.setRoleID(role);
            UsersDTO registrationDto = new UsersDTO(userID, password, fullName, email, phone, address, roledto, true);
//            HttpSession session = request.getSession();
//            session.setAttribute("Account", registrationDto);
            RegistrationDao registrationDao = new RegistrationDao();
            boolean checkUserExist = registrationDao.checkUsername(userID);
            
            if (!checkUserExist) {
                boolean check = registrationDao.insertUser(registrationDto);
                if (check) {
                    url = SUCCESS;
                } else {
                    url = INVALID;
                }
            } else {
                url = INVALID;
                request.setAttribute("UserIDExist", "Tên đăng nhập đã tồn tại");
            }

        } catch (Exception e) {
            e.printStackTrace();
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
