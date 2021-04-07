/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

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
import users.dto.cartObj;
import users.dto.productDTO;
import users.dto.userDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AddController", urlPatterns = {"/AddController"})
public class AddController extends HttpServlet {

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

            HttpSession session = request.getSession();
            cartObj shoppingCart = (cartObj) session.getAttribute("CART");
            if (shoppingCart == null) {
                shoppingCart = new cartObj();
            }
            UserDAO dao = new UserDAO();
            String userID = (String) session.getAttribute("USERID");
            userDTO usDto = dao.findUser(userID);
            String proAddID = request.getParameter("proAddID");
            String proDetailID = request.getParameter("proAddDetailID");
            List<productDTO> listProDetail = dao.findProductSize(proAddID, proDetailID);
            productDTO dto = new productDTO(listProDetail.get(0).getProductID(),
                    listProDetail.get(0).getProductName(), listProDetail.get(0).getProductURLImg(),
                     listProDetail.get(0).getPrice(), listProDetail.get(0).getProductDetailID(), listProDetail.get(0).getSize());
            String squantity = request.getParameter("txtNumber");
            int quantity = 0;
            if (squantity != null) {
                quantity = Integer.parseInt(squantity);
            }

            shoppingCart.addCart(dto, quantity,dto.getSize());
            float total = shoppingCart.getTotal();
            session.setAttribute("CART", shoppingCart);
            session.setAttribute("TOTAL", total);
            session.setAttribute("USER", usDto);
        } catch (Exception e) {
//            log("ERROR at AddController: " + e.getMessage());
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher("productController").forward(request, response);
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
