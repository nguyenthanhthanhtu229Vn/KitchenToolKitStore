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
            <c:if test="${requestScope.LISTORDERINADMIN!=null}" var="checkListProductInAdmin">
                <c:if test="${not empty requestScope.LISTORDERINADMIN}">                
                    <table>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Người đặt</th>
                            <th>SDT</th>
                            <th>Địa chỉ giao hàng</th>
                            <th>Tổng hóa đơn</th>
                            <th>Thời gian</th>
                            <th>Trạng thái</th>
                            <th>Xác nhận thanh toán</th>
                            <th>Chi tiết</th>
                        </tr> 
                        <c:set var="countOrderTrue" value="0"></c:set>
                        <c:set var="countOrderFalse" value="0"></c:set>
                        <c:forEach var="orderDTO" items="${requestScope.LISTORDERINADMIN}" varStatus="counter">
                            <c:set var="countOrder" value="${counter.count}"></c:set>
                            <c:if test="${orderDTO.status==true}">
                                <c:set var="countOrderTrue" value="${countOrderTrue+1}"></c:set>
                            </c:if>
                            <c:if test="${orderDTO.status==false}">
                                <c:set var="countOrderFalse" value="${countOrderFalse+1}"></c:set>
                            </c:if>
                            <tr>                                                                 
                                <td>${orderDTO.orderID}</td>
                                <td>${orderDTO.user.fullname}</td>
                                <td>${orderDTO.phoneNumber}</td>
                                <td>${orderDTO.shipAddress}</td>
                                <td><fmt:formatNumber value="${orderDTO.totalPrice}" maxFractionDigits="0"/> VND</td>
                                <td><fmt:formatDate value="${orderDTO.orderDate}" pattern="dd-MM-yyyy HH:mm:ss" /></td>
                                <td>
                                    <c:if test="${orderDTO.status==true}">Đã thanh toán</c:if>
                                    <c:if test="${orderDTO.status==false}">Chưa thanh toán</c:if>
                                </td>
                                <td>
                                    <form action="MainController?action=ConfirmOrder&txtOrderID=${orderDTO.orderID}&txtStatus=${orderDTO.status}" method="POST">
                                    <input type="hidden" name="txtOrderID" value="${orderDTO.orderID}"/>
                                    <input type="hidden" name="txtStatus" value="${orderDTO.status}"/>
                                    <button <c:if test="${orderDTO.status==true}">disabled="" style="pointer-events: none; background-color: green"</c:if>type="submit" name="action" class="btnSearch" value="ConfirmOrder" onclick="archiveFunction()">
                                    <c:if test="${orderDTO.status==false}">&#10007; Xác nhận</c:if>
                                    <c:if test="${orderDTO.status==true}">&#10003; Đã xác nhận</c:if>
                                    </button>     
                                </form>                          
                                </td>
                                <td>
                                    <c:url var="detailOrder" value="MainController?action=detailOrderInAdmin">
                                        <c:param name="txtOrderID" value="${orderDTO.orderID}"/>
                                        <c:param name="txtUserID" value="${orderDTO.user.userID}"/>
                                    </c:url>
                                    <a href="${detailOrder}" style="font-size:40px">...</a>
                                </td>
                            </tr> 
                        </c:forEach>
                    </table>
                    <div class="total-price">
                        <table>
                            <tr>
                                <td>Số đơn hàng đang chờ xử lý </td>
                                <td><c:out value="${countOrderFalse}"></c:out></td>
                                </tr>
                                <tr>
                                    <td>Số đơn hàng đã xử lý</td>
                                    <td><c:out value="${countOrderTrue}"></c:out></td>
                                </tr>
                                <tr>
                                    <td>Tổng đơn hàng</td>
                                    <td><c:out value="${countOrder}"></c:out></td>
                                </tr>
                            </table>
                        </div>                     
                </c:if>

            </c:if>
            <c:if test="${!checkListProductInAdmin}">
                <h1 style="text-align: center ; color: red">Không có đơn hàng nào!!!</h1>   
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
                    title: "Xác nhận giao dịch này",
                    type: "info",
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
                                swal("Hủy xác nhận", "", "error");
                            }
                        });
            }
        </script>      
    </body>

</html>
