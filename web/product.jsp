<%-- 
    Document   : product
    Created on : Feb 19, 2021, 10:00:35 AM
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
        <link rel="stylesheet" href="css/newcss5.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>


        <%@include file="header.jsp" %>
        <form action="MainController" method="POST">
            <!------------------------- show products ------------->
            <div class="small-container">
                <div class="row row-2">
                    <h2>Tất cả sản phẩm</h2>
                    <div class="searchTT">
                        <input class="text" id="text" type="text" name="txtSearch" placeholder="Tìm kiếm">
                        <i class="fa fa-search"></i>
                    </div>
                    
                    <button id="btnSearch" class="btnSearch" type="submit" name="action" value="Search" style="background-color: #fff; border:none;"></button>
                    <select name="cboChoose" id="" onchange="this.options[this.selectedIndex].value && (window.location = this.options[this.selectedIndex].value);">
                        <option value="productController"  <c:if test="${requestScope.SORT eq 'product'}">selected</c:if> > Mặc định
                            </option>
                            <option value="AscController" <c:if test="${requestScope.SORT eq 'Asc'}">selected</c:if>>Giá tăng dần</option>
                        <option value="DescController" <c:if test="${requestScope.SORT eq 'Desc'}">selected</c:if>>Giá giảm dần</option>
                        <option value="LatestController" <c:if test="${requestScope.SORT eq 'Latest'}">selected</c:if>>Mới nhất</option>
                        </select>
                    </div>
                    <div class="row">
                    <c:if test="${requestScope.PRODUCT != null}">
                        <c:if test="${not empty requestScope.PRODUCT}" var="checkListProduct">
                            <c:forEach var="proDto" items="${requestScope.PRODUCT}">
                                <div class="col-4">
                                    <form  action="MainController" method="POST">
                                        <c:url value="ProductDetailController" var="proDetail">
                                            <c:param name="proID" value="${proDto.productID}"/>
                                            <c:param name="proIMG" value="${proDto.productURLImg}"/>
                                            <c:param name="proAddDetailID" value="${proDto.productDetailID}"/>
                                        </c:url>
                                        <a href="${proDetail}" > <img src="images/${proDto.productURLImg}"> </a> 
                                        <br/>

                                        <h4>${proDto.productName}</h4>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-half-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        </div>
                                        <p><fmt:formatNumber value="${proDto.price}" maxFractionDigits="0"/> VND</p>
                                        <input type="hidden" name="proAddID" value="${proDto.productID}"/>
                                        <input type="hidden" name="proAddDetailID" value="${proDto.productDetailID}"/>
                                        <button  class="AddCartVipPro" name="action" value="Add"><i class="fa fa-shopping-cart" style="font-size:20px"></i> Thêm vào giỏ</button>
                                    </form>

                                </div>                                           
                            </c:forEach>
                        </div>

                    </c:if>
                    <c:if test="${!checkListProduct}">
                        No Product Found!!!
                    </c:if>
                </c:if>

                <!--                <div class="page-btn">
                                    <span>1</span>
                                    <span>2</span>
                                    <span>3</span>
                                    <span>4</span>
                                    <span>&#10132;</span>
                                </div>-->

                <!--<nav aria-label="Page navigation example">-->
                    <!--<ul class="pagination">-->
                    <div class="page-btn">
                        <c:if test="${INDEX>1}">
                            <span><a href="${requestScope.SORT}Controller?index=${INDEX-1}">Trước</a></span>
                            </c:if>
                            <c:forEach var="i" begin="1" end="${requestScope.ENDPAGE}">

                            <span><a  href="${requestScope.SORT}Controller?index=${i}">${i}</a></span>
                            </c:forEach>
                            <c:if test="${INDEX<ENDPAGE}">
                            <span><a href="${requestScope.SORT}Controller?index=${INDEX+1}" >Sau</a></span>
                            </c:if>
                             </div>
                    <!--</ul>-->
                <!--</nav>-->

            </div>
        </div>
    </form>
    <!-- ------------footer------------------- -->
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
    </script>
    <script>
        var input = document.getElementById("text");
        input.addEventListener("keyup", function (event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                document.getElementById("btnSearch").click();
            }
        });
    </script>

</body>
</html>
