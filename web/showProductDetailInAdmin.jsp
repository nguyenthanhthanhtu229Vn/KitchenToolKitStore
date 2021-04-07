<%-- 
    Document   : showProductDetailInAdmin
    Created on : 14-03-2021, 23:50:03
    Author     : ASUS
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DetailProduct-KitchentToolStore</title>
    <link rel="stylesheet" href="css/newcss4.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
   
      <%@include file="header.jsp"%>
    <!------------------------- single prodcut details ------------->
    <div class="small-container single-product">
        <div class="row">
            <div class="col-2">
               <c:set var="dtoImageOriginal" value="${requestScope.LISTIMAGE}"></c:set>
               <img src="images/${dtoImageOriginal.get(0).productURLImg}" width="100%" id="ProductImg">
                <div class="small-img-row">
                    <c:forEach var="dtoImage" items="${requestScope.LISTIMAGE}">
                    <div class="small-img-col">
                        <img src="images/${dtoImage.productURLImg}"  width="100%" class="small-img" alt="Không Hình">
                    </div>  
                    </c:forEach>
                </div>

            </div>
            <div class="col-2">
                <c:set var="dtoItem" value="${requestScope.ITEMNAME}"></c:set>
                <c:forEach var="dtoProductDetail" items="${requestScope.LISTPRODUCTDETAIL}">
                 <a href="MainController?action=ShowProductInAdmin">Quản lý sản phẩm</a>
                <h1>${dtoProductDetail.product.productName}</h1>
                <h4>Giá: <fmt:formatNumber value="${dtoProductDetail.price}" maxFractionDigits="0"/> VND </h4>
                <p>Nhà sản xuất: ${dtoProductDetail.brand}</p>
                <p>Loại: ${requestScope.ITEMNAME}</p>
                <p>Số lượng: ${dtoProductDetail.quantity} </p>
                <p>Size: ${dtoProductDetail.size}</p>               
                <a href="MainController?action=FormAddSizeProductInAdmin&txtProductID=${dtoProductDetail.product.productID}&txtProductDetailID=${dtoProductDetail.productDetailID}" class="btn">Thêm Size cho sản phẩm này</a>
                <h3>Chi tiết sản phẩm<i class="fa fa-indent"></i></h3>
                <br>
                <p>${dtoProductDetail.productDescription}
                </p>
                </c:forEach>
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
            }
            else {
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
