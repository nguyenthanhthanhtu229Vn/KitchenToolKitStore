<%-- 
    Document   : showProductInAdmin
    Created on : 05-03-2021, 11:24:16
    Author     : ASUS
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ManagerProduct-KitchentToolStore</title>
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
        <%@include file="header.jsp"%>
        <!------------------cart items details----------------->
        <div class="small-container productManger-page">
            <c:if test="${requestScope.DETAILORDER!=null}" var="checkListProductInAdmin">
                <c:if test="${not empty requestScope.DETAILORDER}">                
                    <table>
                        <tr>
                            <th>STT</th>
                            <th>Sản phẩm</th>
                            <th>Size</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                        </tr> 
                        <c:set var="countOrderTrue" value="0"></c:set>
                        <c:set var="countOrderFalse" value="0"></c:set>
                        <c:forEach var="odt" items="${requestScope.DETAILORDER}" varStatus="counter">
                            
                            <tr> 
                                <td>${counter.count}</td>
                                <td>${odt.productName}</td>
                                <td>${odt.size}</td>
                                <td>${odt.quantity}</td>
                                <td><fmt:formatNumber value="${odt.unitPrice}" maxFractionDigits="0"/> VND</td>
                            </tr> 
                        </c:forEach>
                    </table>
                     <div class="total-price">
                        <table>                               
                                <tr>
                                    <td>Tổng đơn hàng</td>
                                    <td><fmt:formatNumber value="${requestScope.DTO.totalPrice}" maxFractionDigits="0"/> VND</td>
                                </tr>
                            </table>
                        </div>                          
                </c:if>
                
            </c:if>
            <c:if test="${!checkListProductInAdmin}">
                <h1 style="text-align: center ; color: red">Không có đơn hàng nào!!!</h1>   
            </c:if>
        </div>

        <!--------------footer------------------- -->
        <%@include file="footer.jsp" %>

        <!-------------js for toggle menu------------ -->
        <script>
            var MenuItems = document.getElementById("MenuItems");

            MenuItems.style.maxHeight = "0px";
            function menutoggle() {
                if (MenuItems.style.maxHeight == "0px") {
                    MenuItems.style.maxHeight = "200px";
                } else {
                    MenuItems.style.maxHeight = "0px";
                }
            }

//           //confirm box yes/no delete
         
        </script>      
    </body>

</html>
