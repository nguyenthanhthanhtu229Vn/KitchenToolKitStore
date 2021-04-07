<%-- 
    Document   : orderDetail
    Created on : Mar 15, 2021, 9:53:13 PM
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
        <!----------------------------header.jsp--------------------->

        <form action="MainController" method="POST">

            <div class="small-container productManger-page">
                <c:if test="${not empty requestScope.ORDER}" var="checkListOrder" >                          
                    <table>
                        <tr>
                            <th>STT</th>
                            <th>Hóa đơn</th>
                            <th>Tổng hóa đơn</th>
                            <th>Thời gian</th>
                            <th>Trạng thái</th>
                            <th>Chi tiết</th>
                        </tr> 
                        <c:set var="countOrderTrue" value="0"></c:set>
                        <c:set var="countOrderFalse" value="0"></c:set>
                        <c:forEach var="ordDto" items="${requestScope.ORDER}" varStatus="counter">
                            <tr>                                                                 
                                <td>${counter.count}</td>
                                <td>${ordDto.orderID}</td>
                                <td><fmt:formatNumber value="${ordDto.totalPrice}" maxFractionDigits="0"/> VND</td>
                            <td><fmt:formatDate value="${ordDto.orderDate}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                            <td>
                                <c:if test="${ordDto.status==true}">Đã thanh toán</c:if>
                                <c:if test="${ordDto.status==false}">Chưa thanh toán</c:if>
                                </td>
                                <td>
                                <c:url value="OrderDetailControllers" var="orderDetail">
                                    <c:param name="id" value="${ordDto.orderID}"/>

                                </c:url>  
                                <a href="${orderDetail}" style="font-size:40px">...</a> <br/>
                            </td>
                            </tr> 
                        </c:forEach>
                    </table>   
                </c:if>
                    <c:if test="${!checkListOrder}">
                        <h1>You have not ordered any products yet </h1>
                        <a href="productController"><h1>Shopping Now</h1></a> 
                    </c:if>
            </form>
        </div>

        <!---------------------------footer.jsp------------------------->
        <%@include file="footer.jsp" %>
    </body>
</html>
