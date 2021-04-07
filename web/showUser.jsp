<%-- 
    Document   : showUser
    Created on : 04-03-2021, 23:17:39
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ManagerUser-KitchentToolStore</title>
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
    <%@include file="header.jsp" %>
    <!------------------cart items details----------------->
    <div class="small-container userManager-page">
        <c:if var="checkUser" test="${requestScope.USER!=null}">
            <c:if test="${not empty requestScope.USER}">            
                <table class="tableUser">
                    <tr>
                        <th>STT</th>
                        <th>Tên đăng nhập</th>
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>SDT</th>
                        <th>Địa chỉ</th>
                        <th>Chức năng</th>
                    </tr>
                    <c:set var="countUserUnBlock" value="0"></c:set>
                    <c:set var="countUserBlock" value="0"></c:set>
                    <c:forEach var="userDTO" items="${requestScope.USER}" varStatus="counter">                                                                     
                        <tr>                                    
                            <c:set var="countUser" value="${counter.count}"></c:set>
                            <c:if test="${userDTO.statusIsDelete}" >
                                <c:set var="countUserUnBlock" value="${countUserUnBlock + 1}"></c:set>
                            </c:if>
                            <c:if test="${!userDTO.statusIsDelete}" >
                                <c:set var="countUserBlock" value="${countUserBlock + 1}"></c:set>
                            </c:if>
                            <td>${counter.count}. </td>
                            <td>${userDTO.userID}</td>
                            <td>${userDTO.fullname}</td>
                            <td>${userDTO.email}</td>
                            <td>${userDTO.phone}</td>
                            <td>${userDTO.address}</td>                            
                            <td>                              
                                <form action="MainController?action=Block&txtUserID=${userDTO.userID}&txtStatusBlock=${userDTO.statusIsDelete}" method="POST">
                                    <input type="hidden" name="txtUserID" value="${userDTO.userID}"/>
                                    <input type="hidden" name="txtStatusBlock" value="${userDTO.statusIsDelete}"/>
                                     <button type="submit" name="action" class="btnSearch" value="Block" onclick="archiveFunction()">
                                    <c:if test="${userDTO.statusIsDelete}">Chặn</c:if>
                                    <c:if test="${!userDTO.statusIsDelete}">Bỏ Chặn</c:if>
                                    </button>     
                                </form>
                            </td>
                        </tr>                        
                    </c:forEach>              
                </table>
                <div class="total-price">
                    <table>                   
                        <tr>
                            <td>Số lượng KH không bị chặn</td>
                            <td>
                                <c:out value="${countUserUnBlock}"></c:out>
                                </td>
                            </tr>
                            <tr>
                                <td>Số lượng KH bị chặn</td>                      
                                <td><c:out value="${countUserBlock}"></c:out></td>
                            </tr>
                            <tr>
                                <td>Tổng số lượng KH</td>
                                <td><c:out value="${countUser}"></c:out></td>
                            </tr>
                        </table>
                    </div>
            </c:if>
        </c:if>
        <c:if test="${!checkUser}">
            <h1 style="text-align: center ; color: red">Không người dùng nào!!!</h1>   
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

        let btn = document.getElementById("btnTest123");
        function archiveFunction() {
            event.preventDefault(); // prevent form submit
            var form = event.target.form; // storing the form
            swal({
                title: "Bạn chắc sẽ thực hiện thao tác này",
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
                            swal("Hủy thao tác", "", "error");
                        }
                    });
        }

    </script>
</body>

</html>
