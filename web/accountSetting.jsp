<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html lang="en">

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

        <%@include file="header.jsp" %>
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

                            <p style="color: #555; font-size: 15px; margin: 15px 10px 15px 20px ;text-align: left">Họ và tên: ${ACCOUNTLOGIN.fullname}</p>
                            <p style="color: #555; font-size: 15px; margin: 15px 10px 15px 20px;text-align: left">Email: ${ACCOUNTLOGIN.email}</p>
                            <p style="color: #555; font-size: 15px; margin: 15px 10px 15px 20px;text-align: left">Số điện thoại: ${ACCOUNTLOGIN.phone}</p>
                            <p style="color: #555; font-size: 15px; margin: 15px 10px 15px 20px;text-align: left">Địa chỉ: ${ACCOUNTLOGIN.address}</p>
                            <button class="btn" style="margin-top: 5px; " onclick="window.location.href = 'changeprofile.jsp'">Đổi thông tin</button><br>
                            <button class="btn" style="margin-top: 5px; " onclick="window.location.href = 'changepassword.jsp'">Đổi mật khẩu</button>
                        </div>
                    </div>
                </div>
            </div>
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
    </body>

</html>