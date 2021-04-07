<%-- 
    Document   : orderSuccess
    Created on : Mar 15, 2021, 9:34:55 AM
    Author     : tuana
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/newcss5.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    </head>
    <body>
        <%@include file="header.jsp" %>
        <img style="margin: 0 auto;
             display: block;
             width: 400px;"  src="images/db1d4042ede10f36ec19e34fccf6333e.jpg"/>
        <p style="text-align: center;
    margin-bottom: 10px;
    font-size: 20px;">Đang chờ xử lý đơn hàng (Nếu đơn hàng được xác nhận sản phẩm sẽ đươc giao trong vòng 7 ngày)</p>
        <a class="buttonShoppingNow" href="productController">Tiếp tục mua </a>
        
        <%@include file="footer.jsp" %>
    </body>
</html>
