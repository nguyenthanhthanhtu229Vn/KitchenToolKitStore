<%-- 
    Document   : order
    Created on : Mar 12, 2021, 8:14:47 AM
    Author     : tuana
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
        <link rel="stylesheet" href="css/newcss4.css">
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

        <!-----------------------------header---------->
        <div class="account-page">
            <div class="container">
                <div class="title">Thanh Toán Sản phẩm</div>
                <div class="khung">
                    <form action="MainController" method="POST">
                        Customer Name: ${sessionScope.USER.fullName} <br/>
                        Ship Address:
                        <input type="text" value="${sessionScope.USER.address}" name="txtAddress"/>
                        <br/>
                        <font color="red"> 
                        ${requestScope.ERRORADDRESS}
                        </font> <br/>
                        Phone number: 
                        (+84) <input type="text" value="${sessionScope.USER.phone}" name="txtPhone"/>
                        <br/>
                        <font color="red"> 
                        ${requestScope.ERRORPHONE}
                        </font><br/>
                        Total price:  <fmt:formatNumber value="${sessionScope.TOTAL}" maxFractionDigits="0"/> VND 
                        <br/>
                        <button class="buttonn" name="action" value="Place Order">Đặt hàng</button>
                    </form>
                </div>
            </div>
        </div>
        <!-------------------------footer.jsp-------------------------->
        <%@include file="footer.jsp" %>
    </body>
</html>
