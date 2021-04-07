/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import users.dto.commentDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CommentController", urlPatterns = {"/CommentController"})
public class CommentController extends HttpServlet {

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
            boolean valid = true;
            String comment = request.getParameter("txtComment");
            UserDAO dao = new UserDAO();
            HttpSession session=request.getSession();
            
            String userID = (String)session.getAttribute("USERID");
            String commentID = dao.findCommentID();
            if (commentID == null) {
                commentID = "COMMENT-000";
            }
            commentID = dao.getAutoID(commentID);
           long millis = System.currentTimeMillis();
            Timestamp commentDate =new Timestamp(millis);
            String productID = request.getParameter("proID");
            String urlImg = request.getParameter("proIMG");
            commentDTO dto = new commentDTO(commentID, userID, productID, comment, commentDate);

            if(comment.length() == 0){
                valid = false;
                request.setAttribute("ERROR", "Input your comment");
            }
            if(valid){
                dao.insertComment(dto);
            }
            
        } catch (Exception e) {
        }
        finally {
            request.getRequestDispatcher("ProductDetailController").forward(request, response);
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
