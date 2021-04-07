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
import users.dto.itemDTO;
import users.dto.productDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "ShopController", urlPatterns = {"/ShopController"})
public class ShopController extends HttpServlet {

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
            productDTO dto = null;
            List<itemDTO> listItems = dao.listItems();
             List<productDTO> listHot = dao.hotProduct();
             dto = new productDTO(listHot.get(0).getProductID(),
                    listHot.get(0).getProductName(),listHot.get(0).getProductDetailID() ,listHot.get(0).getProductURLImg()
                    , listHot.get(0).getSize(), listHot.get(0).getBrand(),
                    listHot.get(0).getProductDescription(), listHot.get(0).getItemsName()
                    , listHot.get(0).getPrice(),listHot.get(0).isStatusIsDelete());
             System.out.println(dto.getProductDescription());
                request.setAttribute("HOT", listHot);
                request.setAttribute("NO", dto);
                request.setAttribute("ITEM", listItems);
        } catch (Exception e) {
            log("ERROR at ShopController: " +e.getMessage());
        }
        finally{
            request.getRequestDispatcher("shop.jsp").forward(request, response);
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
