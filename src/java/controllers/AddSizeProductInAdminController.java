/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AdminDAO;
import admin.dtos.ProductDTO;
import admin.dtos.ProductDetailDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AddSizeProductInAdminController", urlPatterns = {"/AddSizeProductInAdminController"})
public class AddSizeProductInAdminController extends HttpServlet {

    private static final String SUCCESS = "ShowProductInAdminController";
    private static final String ERROR = "FormAddSizeProductInAdminController";

    public String convertID(String id) {
        String finalResult = "";
        String[] oldString = id.split("-");
        String firstString = oldString[0];
        int num = Integer.parseInt(oldString[1]) + 1;

        String numFormat = num + "";
        int lenNum = 3;
        int lenZero = lenNum - numFormat.length();

        for (int i = 0; i < lenZero; i++) {
            numFormat = "0" + numFormat;
        }

        finalResult = firstString + "-" + numFormat;

        return finalResult;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("txtProductID");
            String productDetailID = request.getParameter("txtProductDetailID");
            String size = request.getParameter("cbxSize");
            String price = request.getParameter("txtPrice");
            String quantity = request.getParameter("txtQuantity");
            AdminDAO dao = new AdminDAO();
            boolean valid = true;
            String afterProductDetailID;
            
              if (dao.getProductDetailID() != null) {
                String beforeProductDetailID = dao.getProductDetailID();
                afterProductDetailID = convertID(beforeProductDetailID);
            } else {
                afterProductDetailID = "PRODUCTDETAIL-001";
            }
              
            List<ProductDetailDTO> listProductDetail = dao.showProductDetailByProductID(productID);
            for (ProductDetailDTO productDetailDTO : listProductDetail) {
                if (productDetailDTO.getSize().equals(size)) {
                    valid = false;
                    request.setAttribute("ERRORADDSIZE", "Sản phẩm này đã có size "+size+" rồi!");
                }
            }

            if (valid) {
                ProductDTO product=new ProductDTO();
                product.setProductID(productID);
                ProductDetailDTO proDetail = new ProductDetailDTO(afterProductDetailID, product, size, listProductDetail.get(0).getBrand(), Float.parseFloat(price), listProductDetail.get(0).getProductDescription(), Integer.parseInt(price), true);
                if(dao.addProductDetail(proDetail)){
                url = SUCCESS;
                }
            }
        } catch (Exception e) {
            log("ERROR at AddSizeProductInAdminController" + e.getMessage());
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
