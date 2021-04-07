<%-- 
    Document   : cart
    Created on : Feb 19, 2021, 10:02:25 AM
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
        <title>ShoppingCart-KitchentToolStore</title>
        <link rel="stylesheet" href="css/newcss5.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    </head>
    <body>       
        <%@include file="header.jsp"%>
        <!------------------cart items details----------------->
            <c:set var="shop" value="${sessionScope.CART}"/>
            <c:if test="${not empty shop}" var="checkListCart">
                <div class="small-container cart-page">
                    <table>
                        <tr>
                            <th>Sản Phẩm</th>
                            <th>Số lượng</th>
                            <th>Size</th>
                            <th>Giá</th>
                        </tr>
                        <c:forEach var="proTiki" items="${shop}">  
                            <tr>
                                <td>
                                    <div class="cart-info">
                                        <img src="images/${proTiki.value.productURLImg}" alt="">
                                        <div>
                                            <p>${proTiki.value.productName}</p>
                                            <small><fmt:formatNumber value="${proTiki.value.price}" maxFractionDigits="0"/> VND</small>
                                            <br>
                                            <form action="RemoveController?delID=${proTiki.value.productDetailID}" method="POST">
                                                <button type="submit" class="btnSearch" style="width: 133px; height: 50px;" onclick="archiveFunction()">
                                                    Xóa khỏi giỏ hàng
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </td>

                            <form action="MainController" method="POST">
                                <td><input type="number" name="txtQuantity" value="${proTiki.value.quantity}" min="1"/>


                                    <c:forEach var="err" items="${requestScope.ERRORQUANTITY}">
                                        <c:if test="${proTiki.value.productID eq err.key}">
                                            <br/>
                                            <font color="red"> 
                                            ${err.value}
                                        </c:if>
                                        </font> <br/>
                                    </c:forEach>


                                    <input type="hidden" name="edtID" value="${proTiki.value.productDetailID}"/>
                                    <button class="btnUpdateCart" name="action" value="edit">Cập nhật giá</button>
                                </td>
                            </form>
                            <td>${proTiki.value.size}</td>
                            <td><fmt:formatNumber value="${proTiki.value.quantity*proTiki.value.price}" maxFractionDigits="0"/> VND</td>

                            </tr>
                        </c:forEach>    
                    </table>

                    <div class="total-price">
                        <table>
                            <tr>
                                <td>Tổng hóa đơn</td>
                                <td><fmt:formatNumber value="${sessionScope.TOTAL}" maxFractionDigits="0"/> VND </td>
                            </tr>
                        </table>
                    </div>

                    <a href="order.jsp" class="btn">Đặt hàng ngay &#10132;</a>
                </div>
            </c:if>
            <c:if test="${!checkListCart}">
                <h1 style="color: red; text-align:center; font-size: 60px;">You have not ordered any products!!! </h1><br/>
                <a  class="buttonShoppingNow" href="productController">Shopping now</a>
            </c:if>

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

                function archiveFunction() {
                    event.preventDefault(); // prevent form submit
                    var form = event.target.form; // storing the form
                    console.log(event.target.form);
                    swal({
                        title: "Bạn có chắc sẽ xóa sản phẩm này",
                        type: "warning",
                        showCancelButton: true,
                        confirmButtonColor: "#DD6B55",
                        confirmButtonText: "Có",
                        cancelButtonText: "Không",
                        closeOnConfirm: false,
                        closeOnCancel: false
                    },
                            function (isConfirm) {
                                if (isConfirm) {
                                    form.submit();
                                } else {
                                    swal("Hủy xóa sản phẩm", "", "error");
                                }
                            });
                }
            </script>
    </body>
</html>