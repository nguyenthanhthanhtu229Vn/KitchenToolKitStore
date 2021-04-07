/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AdminDAO;
import admin.dtos.OrderDetailDTO;
import admin.dtos.ProductDTO;
import admin.dtos.ProductDetailDTO;
import daos.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.dto.orderDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ShowDetailOrderInAdminController", urlPatterns = {"/ShowDetailOrderInAdminController"})
public class ShowDetailOrderInAdminController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            
            UserDAO dao = new UserDAO();
            HttpSession session=request.getSession();
            String userID = request.getParameter("txtUserID");
            String orderID = request.getParameter("txtOrderID");
          
            List<orderDTO> listDetail = dao.getOrderDetail(userID, orderID);
             System.out.println(listDetail+"a");
            orderDTO dto = new orderDTO(orderID, listDetail.get(0).getOrderDate(), listDetail.get(0).getShipAddress()
                    , listDetail.get(0).getPhoneNumber(), listDetail.get(0).getTotalPrice(), listDetail.get(0).getFullName());
            request.setAttribute("DETAILORDER", listDetail);
            request.setAttribute("DTO", dto);
        } catch (Exception e) {
            log("ERROR at ShowDetailOrderInAdminController");
        }
        finally {
            request.getRequestDispatcher("showOrderDetailInAdmin.jsp").forward(request, response);
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
