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
@WebServlet(name = "ChangeProfileController", urlPatterns = {"/ChangeProfileController"})
public class ChangeProfileController extends HttpServlet {

    private static final String SUCCESS = "accountSetting.jsp";
    private static final String INVALID = "changeprofile.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = INVALID;
        try {
            String fullname = request.getParameter("txtFullname");
            String email = request.getParameter("txtEmail");
            String phone = request.getParameter("txtPhone");
            String address = request.getParameter("txtAddress");
            LoginDao loginDao = new LoginDao();
            HttpSession session = request.getSession();
            UsersDTO accountDTO = (UsersDTO) session.getAttribute("ACCOUNTLOGIN");
            boolean check = loginDao.changeProfile(fullname, email, phone, address, accountDTO.getUserID());
            if (check) {
                url = SUCCESS;
                UsersDTO accountNew = new UsersDTO(accountDTO.getUserID(), accountDTO.getPassword(), fullname, email, phone, address);
                session.setAttribute("ACCOUNTLOGIN", accountNew);
            } else {
                url = INVALID;
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
