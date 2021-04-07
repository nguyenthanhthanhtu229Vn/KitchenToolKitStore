<%-- 
    Document   : header
    Created on : 16-03-2021, 13:43:30
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
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
                        <li><a href="index.jsp">Thống kê</a></li>
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
                                    <a href="MainController?action=Logout">Đăng xuất</a>
                                </c:if>
                                <c:if test="${ACCOUNTLOGIN==null}">
                                    <a href="account.jsp">Đăng nhập</a>
                                </c:if>
                            </div>
                        </div>
                    </li>
                </ul>
            </nav>
            <c:if test="${ROLEID=='ROLE2'||ACCOUNTLOGIN==null}">
                <a <c:if test="${ACCOUNTLOGIN==null}"> href="account.jsp"</c:if> <c:if test="${ACCOUNTLOGIN!=null}"> href="cart.jsp"</c:if>>
<!--                        <img class="imgCart" src="images/cartIcon.png" width="35px" height="35px"></a>-->
<img class="imgCart" src="images/cartIcon.png" width="35px" height="35px">${sessionScope.CART.getSum()}</a>
                </c:if>
            <img src="images/menu.png" class="menu-icon" onclick="menutoggle()">
        </div>
    </div>
</div>
