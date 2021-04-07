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
              <a href="MainController?action=NextFormProduct" class="btn">Thêm sản phẩm mới &#43;</a>
            <c:if test="${requestScope.PRODUCTINADMIN!=null}" var="checkListProductInAdmin">
                <c:if test="${not empty requestScope.PRODUCTINADMIN}">                
                    <table>
                        <tr>
                            <th>STT</th>
                            <th>Tên sản phẩm</th>
                            <th>Size</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                            <th>Chức năng</th>
                            <th>Chi tiết</th>
                        </tr> 
                        <c:set var="countProductStock" value="0"></c:set>
                        <c:set var="countProductUnStock" value="0"></c:set>
                        <c:forEach var="productDTO" items="${requestScope.PRODUCTINADMIN}" varStatus="counter">
                            <c:set var="countProduct" value="${counter.count}"></c:set>
                            <c:if test="${productDTO.quantity>0}">
                                <c:set var="countProductStock" value="${countProductStock+1}"></c:set>
                            </c:if>
                            <c:if test="${productDTO.quantity<=0}">
                                <c:set var="countProductUnStock" value="${countProductUnStock+1}"></c:set>
                            </c:if>
                            <tr>                                                      
                                <td>${counter.count}.</td>             
                                <td>${productDTO.product.productName}</td>
                                <td>${productDTO.size}</td>
                                <td>${productDTO.quantity}</td>
                                <td><fmt:formatNumber value="${productDTO.price}" maxFractionDigits="0"/> VND</td>
                                <td>
                                    <form action="MainController?action=EditProductInAdmin&txtProductDetailID=${productDTO.productDetailID}" method="POST">
                                        <input type="hidden" name="txtProductDetailID" value="${productDTO.productDetailID}"/>
                                        <button name="action" class="btnSearch" type="submit" value="EditProductInAdmin">Cập nhật</button>
                                    </form>
                                    <form action="MainController?action=DeleteProductInAdmin&txtProductDetailID=${productDTO.productDetailID}&txtStatusIsDelete=${productDTO.statusIsDelete}" method="POST">
                                        <input type="hidden" name="txtProductDetailID" value="${productDTO.productDetailID}"/>
                                        <input type="hidden" name="txtStatusIsDelete" value="${productDTO.statusIsDelete}"/>
                                        <button name="action" class="btnSearch" type="submit" value="DeleteProductInAdmin" onclick="archiveFunction()">Xóa</button>
                                    </form>

                                </td>
                                <td>
                                    <c:url var="detailProduct" value="MainController?action=detailProductInAdmin">
                                        <c:param name="txtProductDetailID" value="${productDTO.productDetailID}"/>
                                        <c:param name="txtProductID" value="${productDTO.product.productID}"/>
                                    </c:url>
                                    <a href="${detailProduct}" style="font-size:40px">...</a>
                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                    <div class="total-price">
                        <table>
                            <tr>
                                <td>Số lượng Sản phẩm còn hàng </td>
                                <td><c:out value="${countProductStock}"></c:out></td>
                                </tr>
                                <tr>
                                    <td>Số lượng Sản phẩm hết hàng</td>
                                    <td><c:out value="${countProductUnStock}"></c:out></td>
                                </tr>
                                <tr>
                                    <td>Tổng số lượng sản phẩm</td>
                                    <td><c:out value="${countProduct}"></c:out></td>
                                </tr>
                            </table>
                        </div>                     
                </c:if>

            </c:if>
            <c:if test="${!checkListProductInAdmin}">
                <h1 style="text-align: center ; color: red">Không sản phẩm!!!</h1>   
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
            function archiveFunction() {
                event.preventDefault(); // prevent form submit
                var form = event.target.form; // storing the form
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
                                form.submit();          // submitting the form when user press yes
                            } else {
                                swal("Hủy xóa sản phẩm", "", "error");
                            }
                        });
            }
        </script>      
    </body>

</html>
