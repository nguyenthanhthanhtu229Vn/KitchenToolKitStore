<%-- 
    Document   : productDetails
    Created on : Feb 19, 2021, 10:01:31 AM
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
        <title>DetailProduct-KitchentToolStore</title>
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

        <!------------------------- single prodcut details ------------->
        <form action="MainController" method="POST">
            <div class="small-container single-product">
                <div class="row">
                    <div class="col-2">
                        <img src="images/${requestScope.dtIMG}" width="100%" id="ProductImg">
                        <div class="small-img-row">

                            <c:forEach var="proDetail" items="${requestScope.PRODUCTDETAILIMG}">
                                <div class="small-img-col">
                                    <img src="images/${proDetail.productURLImg}"
                                         width="100%" class="small-img" alt="">
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                    <div class="col-2">
                        <h1>${requestScope.PRODUCTDETAIL.productName}/${requestScope.PRODUCTDETAIL.size}</h1>
                        <h4>Giá: <fmt:formatNumber value="${requestScope.PRODUCTDETAIL.price}" maxFractionDigits="0"/> VND</h4>
                        <p>Nhãn Hàng: ${requestScope.PRODUCTDETAIL.brand}</p>
                        <input type="number" name="txtNumber" value="1" min="1">

                        <p>Size</p>
                        <c:forEach var="pSize" items="${requestScope.SIZE}">
                            <c:url value="ProductDetailController" var="proSize">
                                <c:param name="proID" value="${pSize.productID}"/>
                                <c:param name="proIMG" value="${pSize.productURLImg}"/>
                                <c:param name="proAddDetailID" value="${pSize.productDetailID}"/>
                            </c:url>  
                        
                            <a class="page-link" href="${proSize}">${pSize.size}</a>
                            
                            </c:forEach>    
                        <input type="hidden" name="proAddDetailID" value="${requestScope.PRODUCTDETAIL.productDetailID}"/>
                        <input type="hidden" name="proAddID" value="${requestScope.PRODUCTDETAIL.productID}"/>
                        <input type="hidden" name="proAddSize" value="${requestScope.PRODUCTDETAIL.size}"/>
                        <button value="Add" name="action" class="btnADDTOCART">Thêm Vào Giỏ Hàng</button>

                        <h3>Chi tiết sản phẩm<i class="fa fa-indent"></i></h3>
                        <br>
                        <p>${requestScope.PRODUCTDETAIL.productDescription}
                        </p>

                    </div>
                </div>
            </div>


            <div class="comments-container">
                <h1>Bình luận</h1>

                <ul id="comments-list" class="comments-list">

                    <div>
                        <input class="formComment" type="text" name="txtComment" value="" placeholder="Nhập gì đó..."/>
                        <font color="red" style="margin-left: 100px;"> 
                        ${requestScope.ERROR}
                        </font>
                        <input type="hidden" name="proID" value="${requestScope.PRODUCTDETAIL.productID}"/>
                        <input type="hidden" name="proIMG" value="${requestScope.dtIMG}"/>
                        <!--                        <input class="comment" type="submit" name="action" value="comment"/>-->
                        <button class="comment"  name="action" value="comment">Đăng</button>
                    </div>
                    <c:forEach var="cm" items="${requestScope.COMMENT}">
                        <li>
                            <div class="comment-main-level">                       
                                <div class="comment-box">

                                    <div class="comment-head">
                                        <h6 class="comment-name by-author">${cm.fullName}</h6>
                                        <span><fmt:formatDate value="${cm.commentDate}" pattern="dd-MM-yyyy HH:mm:ss" /></span>
                                        <i class="fa fa-heart"></i>
                                    </div>
                                    <div class="comment-content">
                                        ${cm.content}
                                    </div>

                                </div>
                            </div>                                       
                        </li>
                    </c:forEach>
                </ul>
            </div>               
            <!-----------------------------------tile--------------------------- -->
            <div class="small-container">
                <div class="row row-2">
                    <h2>Sản phẩm tương tự</h2>
                    <a href="SearchController?txtSearch=${requestScope.PRODUCTDETAIL.itemsName}">Xem thêm</a>
                </div>
            </div>

            <!------------------------------products--------------------- -->
            <div class="small-container">
                <div class="row">
                    <c:forEach var="proMore" items="${requestScope.MORE}">
                        <div class="col-4">

                            <c:url value="ProductDetailController" var="proDetail">
                                <c:param name="proAddDetailID" value="${proMore.productDetailID}"/>
                                <c:param name="proID" value="${proMore.productID}"/>
                                <c:param name="proIMG" value="${proMore.productURLImg}"/>
                            </c:url>
                            <a href="${proDetail}" > <img src="images/${proMore.productURLImg}"> </a> 
                            <br/>
                            <h4>${proMore.productName}</h4>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-half-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <p><fmt:formatNumber value="${proMore.price}" maxFractionDigits="0"/> VND</p>
                        </div>
                    </c:forEach>

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


        <!-- -----------------js for product gallery------------ -->
        <script>
            var ProductImg = document.getElementById("ProductImg");
            var SmallImg = document.getElementsByClassName("small-img");

            SmallImg[0].onclick = function () {
                ProductImg.src = SmallImg[0].src;
            }
            SmallImg[1].onclick = function () {
                ProductImg.src = SmallImg[1].src;
            }
            SmallImg[2].onclick = function () {
                ProductImg.src = SmallImg[2].src;
            }
            SmallImg[3].onclick = function () {
                ProductImg.src = SmallImg[3].src;
            }

        </script>

    </body>
</html>
