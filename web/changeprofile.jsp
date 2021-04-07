<%-- 
    Document   : changeprofile
    Created on : Mar 15, 2021, 1:44:14 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account-KitchentToolStore</title>
        <link rel="stylesheet" href="css/newcss.css">
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

        <div class="account-page" >
            <div class="container">
                <div class="row">
                    <div class="col-2">
                        <img src="images/adsMain.jpg" width="100%" alt="">
                    </div>
                    <div class="col-2">

                        <div class="form-container" >
                            <div class="form-btn">
                                <span onclick="register()">Thông tin tài khoản</span>

                            </div>
                            <form action="ChangeProfileController" method="POST" name="Change" onsubmit="return validateChange();">
                                <input style="width: 80%; margin-top: 20px" type="text" placeholder="Họ và tên" name="txtFullname" id="fullName" value="${ACCOUNTLOGIN.fullname}"/>
                                <input style="width: 80%" type="text" placeholder="Email" name="txtEmail" id="email" value="${ACCOUNTLOGIN.email}"/>
                                <input style="width: 80%" type="text" placeholder="Số điện thoại" name="txtPhone" id="phone" value="${ACCOUNTLOGIN.phone}"/>
                                <input style="width: 80%"type="text" placeholder="Địa chỉ" name="txtAddress" id="address" value="${ACCOUNTLOGIN.address}"/>
                                <button style="width: 80%" type="submit" class="btn" name="action" value="Change">Chấp nhận</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
                Indicator.style.transform = "translateX(60px)";
                document.getElementById("RegisterForm").reset();


            }

            function register() {
                RegisterForm.style.transform = "translateX(300px)";
                LoginForm.style.transform = "translateX(300px)";
                Indicator.style.transform = "translateX(-60px)";
                document.getElementById("LoginForm").reset();
            }
        </script>
        <!-- ------------------------js for Validate--------------- -->

        <script>
        function validateChange() {
//                alert("cxzczxc");
//                return false;

                var fullname = document.getElementById("fullName").value.trim();
                var email = document.getElementById("email").value.trim();
                var phone = document.getElementById("phone").value.trim();
                var address = document.getElementById("address").value.trim();
                var emailValidate = /^[a-zA-Z][a-zA-Z0-9_\.]{4,20}@(gmail\.com)$/;
                var phoneValidate = /^0[0-9]{9,10}$/;

                if (fullname.length === 0 || fullname.length === null) {
                    document.forms["Change"]["txtFullname"].focus();
                    swal("Vui lòng nhập họ và tên", "", "error");
                    return false;
                }
                if (fullname.length > 30) {
                    document.forms["Change"]["txtFullname"].focus();
                    swal("Vui lòng nhập họ và tên không quá 30 kí tự", "", "error");
                    return false;
                }

                if (email.length === 0 || email.length === null) {
                    document.forms["Change"]["txtEmail"].focus();
                    swal("Vui lòng nhập email", "", "error");
                    return false;
                }
                if (!emailValidate.test(email)) {
                    document.forms["Change"]["txtEmail"].focus();
                    swal("Email không hợp lệ. Vui lòng nhập theo định dạng xxxxx@gmail.com với x từ 5 đến 20 kí tự", "", "error");
                    return false;
                }

                if (phone.length === 0 || phone === null) {
                    document.forms["Change"]["txtPhone"].focus();
                    swal("Vui lòng nhập số điện thoại", "", "error");
                    return false;
                }
                if (!phoneValidate.test(phone)) {
                    document.forms["Change"]["txtPhone"].focus();
                    swal("Số điện thoại không hợp lệ", "", "error");
                    return false;
                }

                if (address.length === 0 || address.length === null) {
                    document.forms["Change"]["txtAddress"].focus();
                    swal("Vui lòng nhập địa chỉ", "", "error");
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
