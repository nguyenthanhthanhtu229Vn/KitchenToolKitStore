<%-- 
    Document   : account
    Created on : Feb 23, 2021, 3:49:57 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account-KitchentToolStore</title>
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
        <!-- ------------------------account-page----------------------- -->

        <c:if test="${ACCOUNTLOGIN!=null}">  
            <div class="account-page" >
                <div class="container">
                    <div class="row">
                        <div class="col-2">
                            <img src="images/adsMain.jpg" width="100%" alt="">
                        </div>                       
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${ACCOUNTLOGIN==null}">
            <div class="account-page" >
                <div class="container">
                    <div class="row">
                        <div class="col-2">
                            <img src="images/adsMain.jpg" width="100%" alt="">
                        </div>
                        <div class="col-2">

                            <div class="form-container" >
                                <div class="form-btn">
                                    <span onclick="register()">Đăng ký</span>
                                    <span onclick="login()" style="font-size: ">Đăng nhập</span>

                                    <hr id="Indicator">
                                </div>
                                <form id="LoginForm" name="Login" action="MainController" onsubmit="return validateLogin();" method="POST">
                                    <input type="text" placeholder="Tên đăng nhập" name="txtUserIDLogin" id="usernameLogin" value=""/>                               
                                    <input type="password" placeholder="Mật khẩu" name="txtPasswordLogin" id="passwordLogin" value=""/><br>
                                    <p id="a"style="font-size: 12px; color: red">${LoginError}</p>

                                    <button type="submit" class="btn" name="action" value="Login">Đăng nhập</button>

                                </form>

                                <form id="RegisterForm" name="Registration" action="MainController" onsubmit="return validateRegistration();" method="POST"> 

                                    <input type="text" placeholder="Tên đăng nhập" name="txtUserRegis" id="usernameRegis" value=""/>
                                    <input type="text" placeholder="Họ và tên" name="txtFullname" id="fullName" value=""/>
                                    <input type="text" placeholder="Email" name="txtEmail" id="email" value=""/>
                                    <input type="password" placeholder="Mật khẩu" name="txtPasswordRegis" id="passwordRegis" value=""/>
                                    <input type="password" placeholder="Nhập lại mật khẩu" name="txtRePasswordRegis" id="rePasswordRegis" value=""/>
                                    <input type="text" placeholder="Số điện thoại" name="txtPhone" id="phone" value=""/>
                                    <input type="text" placeholder="Địa chỉ" name="txtAddress" id="address" value=""/>
                                    <c:if test="${UserIDExist!=null}">
                                        <script>

                                            window.onload = function () {
                                                register();
                                            };
                                        </script>
                                    </c:if>

                                    <p style="font-size: 12px; color: red">${UserIDExist}</p>
                                    <button type="submit" class="btn" name="action" value="Registration">Đăng ký</button>                            
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!--------------footer------------------- -->
        <%@include file="footer.jsp"%>

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
        <!-- ------------------------js for toggle form--------------- -->
        <script>
            var LoginForm = document.getElementById("LoginForm");
            var RegisterForm = document.getElementById("RegisterForm");
            var Indicator = document.getElementById("Indicator");

            function login() {
                RegisterForm.style.transform = "translateX(0px)";
                LoginForm.style.transform = "translateX(0px)";
                Indicator.style.transform = "translateX(120px)";
                document.getElementById("RegisterForm").reset();


            }

            function register() {
                RegisterForm.style.transform = "translateX(300px)";
                LoginForm.style.transform = "translateX(300px)";
                Indicator.style.transform = "translateX(0px)";
                document.getElementById("LoginForm").reset();
            }
        </script>
        <!-- ------------------------js for Validate--------------- -->
        <script>
            function validateLogin() {
                var username = document.getElementById("usernameLogin").value.trim();
                var password = document.getElementById("passwordLogin").value.trim();
                var usernameValidate = /^[a-zA-Z0-9]+$/;
                if (username.length === 0 || username === null) {
                    document.forms["Login"]["txtUserIDLogin"].focus();
                     swal("Vui lòng nhập tên đăng nhập", "", "error");
                    return false;
                }
                if (!usernameValidate.test(username)) {
                    document.forms["Login"]["txtUserIDLogin"].focus();
                     swal("Tên đăng nhập không có dấu", "", "error");
                    return false;
                }
                if (username.length < 5 || username.length > 30) {
                    document.forms["Login"]["txtUserIDLogin"].focus();
                     swal("Tên đăng nhập có ít nhất 5 kí tự và tối đa 30 kí tự", "", "error");
                    return false;
                }
                if (password.length === 0 || password === null) {
                    document.forms["Login"]["txtPasswordLogin"].focus();
                     swal("Vui lòng nhập mật khẩu", "", "error");
                    return false;
                }
                return true;

            }
        </script>
        <script>
            function validateRegistration() {
//                alert("cxzczxc");
//                return false;
                var username = document.getElementById("usernameRegis").value.trim();
                var fullname = document.getElementById("fullName").value.trim();
                var email = document.getElementById("email").value.trim();
                var password = document.getElementById("passwordRegis").value.trim();
                var rePassword = document.getElementById("rePasswordRegis").value.trim();
                var phone = document.getElementById("phone").value.trim();
                var address = document.getElementById("address").value.trim();

                var usernameValidate = /^[a-zA-Z0-9]+$/;
                var emailValidate = /^[a-zA-Z][a-zA-Z0-9_\.]{4,20}@(gmail\.com)$/;
                var phoneValidate = /^0[0-9]{9,10}$/;

                if (username.length === 0 || username === null) {
                    document.forms["Registration"]["txtUserRegis"].focus();
                    swal("Vui lòng nhập tên đăng nhập", "", "error");
                    return false;
                }
                if (!usernameValidate.test(username)) {
                    document.forms["Registration"]["txtUserRegis"].focus();
                    swal("Tên đăng nhập không có dấu", "", "error");
                    return false;
                }
                if (username.length < 5 || username.length > 30) {
                    document.forms["Registration"]["txtUserRegis"].focus();
                    swal("Tên đăng nhập có ít nhất 5 kí tự và tối đa 30 kí tự", "", "error");
                    return false;
                }

                if (fullname.length === 0 || fullname.length === null) {
                    document.forms["Registration"]["txtFullname"].focus();
                    swal("Vui lòng nhập họ và tên", "", "error");
                    return false;
                }
                if (fullname.length > 30) {
                    document.forms["Registration"]["txtFullname"].focus();
                    swal("Vui lòng nhập họ và tên không quá 30 kí tự", "", "error");
                    return false;
                }

                if (email.length === 0 || email.length === null) {
                    document.forms["Registration"]["txtEmail"].focus();
                    swal("Vui lòng nhập email", "", "error");
                    return false;
                }
                if (!emailValidate.test(email)) {
                    document.forms["Registration"]["txtEmail"].focus();
                    swal("Email không hợp lệ. Vui lòng nhập theo định dạng xxxxx@gmail.com với x từ 5 đến 20 kí tự", "", "error");
                    return false;
                }

                if (password.length === 0 || password.length === null) {
                    document.forms["Registration"]["txtPasswordRegis"].focus();
                    swal("Vui lòng nhập mật khẩu", "", "error");
                    return false;
                }
                if (password.length < 5 || password.length > 30) {
                    document.forms["Registration"]["txtPasswordRegis"].focus();
                    swal("Vui lòng nhập mật khẩu có từ 5 đến 30 kí tự", "", "error");
                    return false;
                }

                if (rePassword.length === 0 || rePassword.length === null) {
                    document.forms["Registration"]["txtRePasswordRegis"].focus();
                    swal("Vui lòng nhập lại mật khẩu", "", "error");
                    return false;
                }
                if (rePassword !== password) {
                    document.forms["Registration"]["txtRePasswordRegis"].focus();
                    swal("Mật khẩu không khớp", "", "error");
                    return false;
                }

                if (phone.length === 0 || phone === null) {
                    document.forms["Registration"]["txtPhone"].focus();
                    swal("Vui lòng nhập số điện thoại", "", "error");
                    return false;
                }
                if (!phoneValidate.test(phone)) {
                    document.forms["Registration"]["txtPhone"].focus();
                    swal("Số điện thoại không hợp lệ", "", "error");
                    return false;
                }

                if (address.length === 0 || address.length === null) {
                    document.forms["Registration"]["txtAddress"].focus();
                    swal("Vui lòng nhập địa chỉ", "", "error");
                    return false;
                }

                return true;
            }
        </script>
    </body>

</html>