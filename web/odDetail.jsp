<%-- 
    Document   : odDetail
    Created on : Mar 16, 2021, 9:57:29 AM
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
        <title>All Products-KitchentToolStore</title>
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
        <!-------------------------header.jsp----------------------->
        <form action="MainController" method="POST">
            <c:set var="shop" value="${requestScope.DETAILORDER}"/>
            <c:if test="${not empty shop}" var="checkListCart">
                <div class="small-container cart-page">
                    <table>
                        <tr>
                            <th>STT</th>
                            <th>Sản Phẩm</th>
                            <th>Size</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                        </tr>
                        <c:forEach var="odt" items="${requestScope.DETAILORDER}" varStatus="counter">
                            <tr>
                                <td>${counter.count}</td>
                                <td>
                                    <div class="cart-info">
                                        <img src="images/${odt.urlImg}" alt="">
                                        <div>
                                            <p>${odt.productName}</p>
                                            <small><fmt:formatNumber value="${odt.unitPrice}" maxFractionDigits="0"/> VND</small>
                                            <br>
                                        </div>
                                    </div>
                                </td>
                                <td>${odt.size}</td>
                                <td>${odt.quantity}
                                </td>

                                <td><fmt:formatNumber value="${odt.unitPrice*odt.quantity}" maxFractionDigits="0"/> VND</td>

                            </tr>
                        </c:forEach>    
                    </table>
                    <div class="total-price">
                        <table>
                            <tr>
                                <td>Tổng hóa đơn</td>
                                <td><fmt:formatNumber value="${requestScope.DTO.totalPrice}" maxFractionDigits="0"/> VND </td>
                            </tr>
                        </table>
                    </div> 
                </div>
            </c:if>
            <c:if test="${!checkListCart}">
                <h1 style="color: red; text-align:center; font-size: 60px;">Bạn không có sản phẩm này!!! </h1><br/>
            </c:if>
        <!------------footer.jsp-->
        <%@include file="footer.jsp" %>
                </form>
    </body>
</html>
