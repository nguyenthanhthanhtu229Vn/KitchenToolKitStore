<%-- 
    Document   : changepassword
    Created on : Mar 15, 2021, 1:44:54 AM
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
                                <span onclick="register()">Thay đổi mật khẩu</span>

                            </div>
                            <form action="ChangePasswordController" method="POST" name="ChangePass" onsubmit="return validateChangePassword();">
                                <input style="width: 80% ; margin-top: 20px" type="password" placeholder="Mật khẩu cũ" name="txtPasswordOld" id="passwordOld" value=""/>
                                <input style="width: 80%" type="password" placeholder="Mật khẩu mới" name="txtPasswordNew" id="passwordNew" value=""/>
                                <input style="width: 80%" type="password" placeholder="Nhập lại mật khẩu" name="txtRePasswordNew" id="rePasswordNew" value=""/>
                                <font style="color: red">${PASSERROR}</font>
                                <button style="width: 80%" type="submit" class="btn" name="action" value="ChangePass">Chấp nhận</button>
                            </form>
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

        <!-- ------------------------js for Validate--------------- -->

        <script>
            function validateChangePassword() {
//                alert("cxzczxc");
//                return false;
                var passwordOld = document.getElementById("passwordOld").value.trim();
                var password = document.getElementById("passwordNew").value.trim();
                var rePassword = document.getElementById("rePasswordNew").value.trim();

                if (passwordOld.length === 0 || passwordOld.length === null) {                    
                    document.forms["ChangePass"]["txtPasswordOld"].focus();
                    swal("Vui lòng nhập mật khẩu cũ", "", "error");
                    return false;
                }


                if (password.length === 0 || password.length === null) {
                    
                    document.forms["ChangePass"]["txtPasswordNew"].focus();
                    swal("Vui lòng nhập mật khẩu mới", "", "error");
                    return false;
                }
                if (password.length < 5 || password.length > 30) {
                    
                    document.forms["ChangePass"]["txtPasswordNew"].focus();
                    swal("Vui lòng nhập mật khẩu có từ 5 đến 30 kí tự", "", "error");
                    return false;
                }

                if (rePassword.length === 0 || rePassword.length === null) {                   
                    document.forms["ChangePass"]["txtRePasswordNew"].focus();
                    swal("Vui lòng nhập lại mật khẩu", "", "error");
                    return false;
                }
                if (rePassword !== password) {                    
                    document.forms["ChangePass"]["txtRePasswordNew"].focus();
                    swal("Mật khẩu không khớp", "", "error");
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
