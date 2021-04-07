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
@WebServlet(name = "ChangePasswordController", urlPatterns = {"/ChangePasswordController"})
public class ChangePasswordController extends HttpServlet {

    private static final String SUCCESS = "accountSetting.jsp";
    private static final String INVALID = "changepassword.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = INVALID;
        try {
            String passwordOld = request.getParameter("txtPasswordOld");
            String passwordNew = request.getParameter("txtPasswordNew");
            HttpSession session = request.getSession();
            LoginDao loginDao = new LoginDao();
            UsersDTO accountDto = (UsersDTO) session.getAttribute("ACCOUNTLOGIN");
            boolean checkPassInvalid = loginDao.checkPassword(accountDto.getUserID(), passwordOld);
            if (checkPassInvalid) {
                boolean checkChange = loginDao.changePassword(accountDto.getUserID(), passwordNew);
                if (checkChange) {
                    url = SUCCESS;
                } else {
                    url = INVALID;
                    request.setAttribute("PASSERROR", "Đổi không được");
                }
            } else {
                url = INVALID;
                request.setAttribute("PASSERROR", "Mật khẩu cũ không đúng");
            }
        } catch (Exception e) {
            log("ERROR at ChangePasswordCOntroller" + e.getMessage());
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
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
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
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
