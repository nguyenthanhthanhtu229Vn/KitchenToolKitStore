<%-- 
    Document   : shop
    Created on : Feb 19, 2021, 9:57:10 AM
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
        <title>KitchenToolStore</title>
        <link rel="stylesheet" href="css/newcss5.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <div class="header">

            <div class="container">
                <div class="navbar">
                    <div class="logo">
                        <a href="ShopController"><img src="images/logoMain.jpg" width="125px"></a>
                    </div>
                    <link href="css/style.css" rel="stylesheet" type="text/css"/>
                    <h1 style="font-family: 'Pacifico', cursive">Kitchen Tool Store</h1>
                    <nav>
                        <ul id="MenuItems">
                            <c:if test="${ROLEID=='ROLE2'||ACCOUNTLOGIN==null}">
                                <li><a href="ShopController">Trang chủ</a></li>
                                <li><a href="productController">Sản phẩm</a></li>
                                <li><a href="lienhe.jsp">Liên hệ</a></li>
                                <!--                            <li><a href="account.html">Tài khoản</a></li>-->
                            </c:if>
                            <c:if test="${ROLEID=='ROLE2'}">    
                                <li><a href="OrderDetailController">Lịch sử</a></li> 
                                </c:if>
                                <c:if test="${ROLEID=='ROLE1'}">
                                <li><a href="MainController?action=ShowUserInAdmin">Thống kê</a></li>
                                <li><a href="MainController?action=ShowUserInAdmin">Quản lý KH</a></li>
                                <li><a href="MainController?action=ShowProductInAdmin">Quản lý sản phẩm</a></li>
                                <li><a href="MainController?action=ShowOrderInAdmin">Quản lý đơn hàng</a></li>
                                </c:if>
                            <li><div class="dropdown">
                                    <c:if test="${ACCOUNTLOGIN==null}">
                                        <a class="dropbtn">Tài khoản</a>
                                    </c:if>
                                    <c:if test="${ACCOUNTLOGIN!=null}">
                                        <a class="dropbtn">${ACCOUNTLOGIN.fullname}</a>
                                    </c:if>
                                    <div class="dropdown-content">
                                        <c:if test="${ACCOUNTLOGIN!=null}">
                                            <a href="accountSetting.jsp">&#128100 Hồ sơ</a>   
                                            <a href="LogoutController">Đăng xuất</a>
                                        </c:if>
                                        <c:if test="${ACCOUNTLOGIN==null}">
                                            <a href="account.jsp">Đăng nhập</a>
                                        </c:if>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <c:if test="${ACCOUNTLOGIN.role.roleID=='ROLE2'||ACCOUNTLOGIN==null}">
                        <a <c:if test="${ACCOUNTLOGIN==null}"> href="account.jsp"</c:if> <c:if test="${ACCOUNTLOGIN!=null}"> href="cart.jsp"</c:if>>
                            <img class="imgCart" src="images/cartIcon.png" width="35px" height="35px">${sessionScope.CART.getSum()}</a>
                        </c:if>
                    <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
                </div>
                <div class="row">
                    <div class="col-2">
                        <h1>DỤNG CỤ NHÀ BẾP  <br> CAO CẤP</h1>
                        <p>Sẽ bao gồm tất cả đồ dùng, vật dụng từ bình thường tất yếu cần thiết phải<br> có trong bếp của mỗi nhà. 
                            <br> Cho đến những vật dụng cao cấp, thông minh, hiện đại và tiện nghi nhất <br>trong việc làm “một tay” giúp đỡ chuyện bếp núc gia đình.
                        </p>
                        <a href="productController" class="btn">Khám Phá Ngay &#10132;</a>
                    </div>
                    <div class="col-2">
                        <img src="images/adsMain.jpg">
                    </div>
                </div>
            </div>
        </div>

        <!------------------------- featured categories ------------->
        <div class="categories">
            <div class="small-container">

                <div class="row">
                    <c:forEach var="itDto" items="${requestScope.ITEM}">
                        <div class="col-3">
                            <c:url value="SearchController" var="proIt">
                                <c:param name="txtSearch" value="${itDto.itemsName}"/>

                            </c:url>
                            <a href="${proIt}" > <img src="images/${itDto.itemsImg}"> </a> <br/>
                            <br/>

                        </div>
                    </c:forEach>

                </div>
            </div>
        </div>

        <!------------------------- featured products ------------->
        <div class="small-container">

            <h2 class="title">SẢN PHẨM MỚI NHẤT</h2>
            <div class="row">
                <c:forEach var="proDto" items="${requestScope.HOT}">
                    <div class="col-4">
                        <c:url value="ProductDetailController" var="proDetail">
                            <c:param name="proAddDetailID" value="${proDto.productDetailID}"/>
                            <c:param name="proID" value="${proDto.productID}"/>
                            <c:param name="proIMG" value="${proDto.productURLImg}"/>

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
                    </div>
                </c:forEach>


            </div>
        </div>
        <!----------------------------- offer ------------------->
        <div class="offer">
            <div class="small-container">
                <div class="row">
                    <div class="col-2">
                        <c:url value="ProductDetailController" var="proNo">
                            <c:param name="proID" value="${requestScope.NO.productID}"/>
                            <c:param name="proIMG" value="${requestScope.NO.productURLImg}"/>
                            <c:param name="proAddDetailID" value="${requestScope.NO.productDetailID}"/>
                        </c:url>
                        <a href="${proNo}"> <img src="images/${requestScope.NO.productURLImg}"> </a> 
                        <br/>
                    </div>
                    <div class="col-2">
                        <p>Sản phẩm mới nhất của Kitchen Tool Store</p>
                        <h1>${requestScope.NO.productName}</h1>
                        <small>${requestScope.NO.productDescription}
                        </small>
                        <br>
                        <c:url value="ProductDetailController" var="proNo1">
                            <c:param name="proID" value="${requestScope.NO.productID}"/>
                            <c:param name="proIMG" value="${requestScope.NO.productURLImg}"/>
                            <c:param name="proAddDetailID" value="${requestScope.NO.productDetailID}"/>
                        </c:url>
                        <a href="${proNo1}" class="btn">Mua Ngay &#10132;</a>
                    </div>
                </div>
            </div>
        </div>

        <!--------------------------------- testimonial ----------------->
        <div class="testimonial">
            <div class="small-container">
                <div class="row">
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>
                            SE140888
                        </p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <img style="width: 13%" src="images/ani.jpg">
                        <h3>Nguyễn Hồng Nhân</h3>
                    </div>
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>
                            SE140890
                        </p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <img src="images/tanh.jpg">
                        <h3>Nguyễn Tuấn Anh</h3>
                    </div>
                    <div class="col-3">
                        <i class="fa fa-quote-left"></i>
                        <p>
                            SE140127
                        </p>
                        <div class="rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <i class="fa fa-star-o"></i>
                        </div>
                        <img src="images/tucute.jpg">
                        <h3>Nguyễn Thanh Thanh Tú</h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- --------------Brands--------------------- -->
        <div class="brands">
            <div class="small-container">
                <div class="row">
                    <div class="col-5">
                        <a href="https://elmich.vn/"><img src="images/Brandimg/Elmich.png"></a>
                    </div>
                    <div class="col-5">
                        <a href="https://www.kovapaint.com/"><img src="images/Brandimg/Kova.png"></a>
                    </div>
                    <div class="col-5">
                        <a href="https://sunhouseonline.vn/"><img src="images/Brandimg/Sunhouse.png"></a>
                    </div>
                    <div class="col-5">
                        <a href="https://www.facebook.com/maxsunvn/"><img src="images/Brandimg/Maxsun.png"></a>
                    </div>
                    <div class="col-5">
                        <a href="https://www.paypal.com/vn/webapps/mpp/merchant?&kid=p25600854203&gclid=Cj0KCQjwl9GCBhDvARIsAFunhskvfPT-t2wk0msXHyNlODFmqrf4cNpB2_1yshxIkzoxxtTcAd4cwNMaAki4EALw_wcB&gclsrc=aw.ds"><img src="images/Brandimg/Paypal.png"></a>
                    </div>
                </div>
            </div>
        </div>

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
    </body>
</html>
