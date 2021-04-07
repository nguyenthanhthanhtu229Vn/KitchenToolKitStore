/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.AdminDAO;
import admin.dtos.ImagesDTO;
import admin.dtos.ItemsDTO;
import admin.dtos.ProductDTO;
import admin.dtos.ProductDetailDTO;
import admin.dtos.UsersDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AddNewProductController", urlPatterns = {"/AddNewProductController"})
public class AddNewProductController extends HttpServlet {

    private static final String SUCCESS = "ShowProductInAdminController";
    private static final String ERROR = "NextFormProductController";
    private static final String INVALID = "LoadCategoriesController";

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
           FileItemFactory factory=new DiskFileItemFactory();
                ServletFileUpload upload=new ServletFileUpload(factory);
                List items=null;
                try {
                    items=upload.parseRequest(request);
                } catch (FileUploadException e) {
                    e.printStackTrace();
                }
                Iterator iter=items.iterator();
                Hashtable params=new Hashtable();
                String fileName=null;
                while(iter.hasNext()){
                    FileItem item=(FileItem)iter.next();
                    if(item.isFormField()){
                        params.put(item.getFieldName(), item.getString("utf-8"));
                    }else{
                        try {
                            String itemName=item.getName();
                            fileName=itemName.substring(itemName.lastIndexOf("\\")+1);
                            System.out.println("path"+fileName);
                            String realPath=getServletContext().getRealPath("/")+"images\\"+fileName;
                            System.out.println("Rpath"+realPath);
                            File savedFile=new File(realPath);
                            item.write(savedFile);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            String productName = (String)params.get("txtProductName");
            String size = (String)params.get("cbxSize");
            String brand = (String)params.get("txtBrand");
            String price =(String)params.get("txtPrice");
            String description = (String)params.get("txtDescription");
            String quantity = (String)params.get("txtQuantity");
            String itemszz = (String)params.get("cbxItem");
            String image = (String)params.get("txtImageURL");
            HttpSession session = request.getSession();
            String admin = (String) session.getAttribute("USERID");
            AdminDAO dao = new AdminDAO();
            String afterImgaeID, afterProductDetailID, afterProductID;
            if (dao.getImageID() != null) {
                String beforeImgaeID = dao.getImageID();
                afterImgaeID = convertID(beforeImgaeID);
            } else {
                afterImgaeID = "IMAGE-001";
            }
            if (dao.getProductDetailID() != null) {
                String beforeProductDetailID = dao.getProductDetailID();
                afterProductDetailID = convertID(beforeProductDetailID);
            } else {
                afterProductDetailID = "PRODUCTDETAIL-001";
            }
            if (dao.getProductID() != null) {
                String beforeProductID = dao.getProductID();
                afterProductID = convertID(beforeProductID);
            } else {
                afterProductID = "PRODUCT-001";
            }
            System.out.println(afterProductID);
//            Add vào CSDL
            ItemsDTO itemsdto = new ItemsDTO();
            itemsdto.setItemsID(itemszz.trim());
            UsersDTO userdto = new UsersDTO();
            userdto.setUserID(admin);
            ProductDTO product = new ProductDTO(afterProductID, userdto, itemsdto, productName.trim());
            ProductDetailDTO productDetail = new ProductDetailDTO(afterProductDetailID, product, size, brand.trim(), Float.parseFloat(price), description.trim(), Integer.parseInt(quantity), true);
            ImagesDTO imageDto = new ImagesDTO(afterImgaeID, fileName, product);

            if (dao.addProduct(product)&&dao.addProductDetail(productDetail)&&dao.addImageProduct(imageDto)) {
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("ERROR at AddNewProductController" + e.getMessage());
            if (e.getMessage().contains("duplicate")) {
                request.setAttribute("ERRORADD", "dupplicate");
                url = INVALID;
            }
//            e.printStackTrace();
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
