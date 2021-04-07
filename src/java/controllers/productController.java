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
import javax.servlet.http.HttpSession;
import org.apache.catalina.User;
import users.dto.productDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "productController", urlPatterns = {"/productController"})
public class productController extends HttpServlet {

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
            List<productDTO> listProduct = dao.loadAllProduct();
             int count = listProduct.size();
            int endPage = count/10;
            if(count%10!=0){
                endPage++;
            }
            String sIndex= request.getParameter("index");
            int index;
            if(sIndex == null){
                sIndex = "1";
            }
            index = Integer.parseInt(sIndex);
            List<productDTO> listProPage = new ArrayList<>();
            int star = (index-1)*10;
            int end;
                    
                if(listProduct.size() - (index*10)>0){
                    end =star+10;
                }
                else{
                    end = listProduct.size();
                }
                for (int i = star; i < end; i++) {
                
                dto = new productDTO(listProduct.get(i).getProductID(), listProduct.get(i).getUserID(),
                        listProduct.get(i).getItemsID(), listProduct.get(i).getProductName(),
                        listProduct.get(i).getProductImgID(), listProduct.get(i).getProductURLImg()
                        , listProduct.get(i).getPrice(), listProduct.get(i).getProductDetailID());
                listProPage.add(dto);
            }
                request.setAttribute("PRODUCT", listProPage);
                request.setAttribute("ENDPAGE", endPage);
                request.setAttribute("SORT", "product");
                request.setAttribute("INDEX", index);
        } 
        catch (Exception e){
            log("Erorr at productController "+  e.getMessage());
        }
        finally{
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
