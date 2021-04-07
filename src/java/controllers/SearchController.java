/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import users.dto.productDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {

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
            String search = request.getParameter("txtSearch");
            if (search == null) {
                search = "";
            }
            List<productDTO> searchList = dao.findByProductName(search);
            int count = searchList.size();
            int endPage = count / 10;
            if (count % 10 != 0) {
                endPage++;
            }
            String sIndex = request.getParameter("index");
            int index;
            if (sIndex == null) {
                sIndex = "1";
            }
            index = Integer.parseInt(sIndex);
            List<productDTO> listProPage = new ArrayList<>();
            int star = (index - 1) * 10;
            System.out.println(star);
            int end;

            if (searchList.size() - (index * 10) > 0) {
                end = star + 10;
            } else {
                end = searchList.size();
            }
            for (int i = star; i < end; i++) {

                dto = new productDTO(searchList.get(i).getProductID(), searchList.get(i).getUserID(),
                         searchList.get(i).getItemsID(), searchList.get(i).getProductName(),
                         searchList.get(i).getProductImgID(), searchList.get(i).getProductURLImg(),
                        searchList.get(i).getPrice(), searchList.get(i).getProductDetailID());
                listProPage.add(dto);
            }

            for (productDTO dTO : searchList) {
                System.out.println(dTO.getProductName());
            }

            request.setAttribute("PRODUCT", listProPage);
            request.setAttribute("ENDPAGE", endPage);
            request.setAttribute("SORT", "Search");
            request.setAttribute("INDEX", index);
        } catch (Exception e) {
            log("ERROR at SearchController :" + e.getMessage());
        } finally {
            request.getRequestDispatcher("product.jsp").forward(request, response);
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
