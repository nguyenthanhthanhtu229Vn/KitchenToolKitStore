<%-- 
    Document   : updateProductInAdmin
    Created on : 15-03-2021, 11:09:27
    Author     : ASUS
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EditProduct-KitchentToolStore</title>
        <link rel="stylesheet" href="css/newcss4.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
              rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" />
        <script src="https://kit.fontawesome.com/a076d05399.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
    </head>

    <body>
        <%@include file="header.jsp"%>
        <!-- ------------------------account-page----------------------- -->
        <div class="account-page">
            <div class="container">
                <div class="title">Cập nhật sản phẩm</div>
                <div class="khung">     
                    <form name="UpdateProduct" action="MainController?action=UpdateProductInAdmin" method="POST" onsubmit="return validateInput()">
                        <div class="user-details">
                            <div class="input-box">
                                <div class="container1">
                                    <div class="wrapper" style="margin-top: 0px;">
                                        <div class="image">
                                            <c:set var="dtoImage" value="${requestScope.LISTIMAGE}"></c:set>
                                            <img id="img1"src="images/${dtoImage.get(0).productURLImg}">
                                        </div>
                                    </div>
                                </div> 
                                <c:set var="dtoProduct" value="${requestScope.PRODUCTDETAIL}"></c:set>
                                    <span class="details">Tên sản phẩm</span>
                                    <input id="productName" type="text" placeholder="Nhập tên sản phẩm" name="txtProductName" value="${dtoProduct.product.productName}" />
                                <span class="details">Size</span><br />   
                                <input type="text" name="cbxSize" value="${dtoProduct.size}" readonly=""/>
                                <span class="details">Nhà sản xuất</span>
                                <input id="brand" type="text" placeholder="Nhập tên nhãn hiệu" name="txtBrand" value="${dtoProduct.brand}" />
                                <span class="details">Giá</span>                                       
                                <input id="price" type="number" placeholder="Nhập tên giá" name="txtPrice" value="<fmt:formatNumber pattern="0.00" type = "number" value="${dtoProduct.price}" maxFractionDigits="0"/>" />
                                <span class="details">Mô tả sản phẩm</span>
                                <input id="description" class="area" type="text" placeholder="Mô tả sản phẩm" name="txtDescription" value="${dtoProduct.productDescription}" />
                                <span class="details">Số lượng sản phẩm</span>
                                <input id="quantity" type="number" placeholder="Số lượng sản phẩm" name="txtQuantity"  value="${dtoProduct.quantity}" />
                                <span class="details">Loại sản phẩm</span><br />
                                <select name="cbxItem" id="" required="">
                                    <c:forEach var="dtoItem" items="${requestScope.LISTITEM}">
                                        <option <c:if test="${dtoProduct.product.items.itemsID==dtoItem.itemsID}">selected=""</c:if> value="${dtoItem.itemsID}">${dtoItem.itemsName}</option>                              
                                    </c:forEach>
                                </select><br />  
                                <input type="hidden"  name="txtProductDetailID" value="${dtoProduct.productDetailID}"/>
                                <input type="hidden"  name="txtProductID" value="${dtoProduct.product.productID}"/>
                            </div>
                        </div>   
                            <button class="buttonn">Cập nhật sản phẩm</button>
                    </form>
                    
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
        <script>
           function validateInput() {
                var productName = document.getElementById("productName").value.trim();
                var brand = document.getElementById("brand").value.trim();
                var price = document.getElementById("price").value.trim();
                var quantity = document.getElementById("quantity").value.trim();
                var description = document.getElementById("description").value.trim();
                if (productName.length === 0 || productName === null) {
                    document.forms["UpdateProduct"]["txtProductName"].focus();
                    swal("Vui lòng nhập tên sản phẩm!", "", "error");
                    return false;
                }
                if (brand.length === 0 || brand === null) {
                    document.forms["UpdateProduct"]["txtBrand"].focus();
                    swal("Vui lòng nhập tên nhà sản xuất", "", "error");
                    return false;
                }
                if (price.length === 0 || price === null) {
                    document.forms["UpdateProduct"]["txtPrice"].focus();
                    swal("Vui lòng nhập giá sản phẩm", "", "error");
                    return false;
                }
                if (parseFloat(price) <= 0) {
                    document.forms["UpdateProduct"]["txtPrice"].focus();
                    swal("Vui lòng nhập giá sản phẩm > 0", "", "error");
                    return false;
                }
                if (description.length === 0 || description === null) {
                    document.forms["UpdateProduct"]["txtDescription"].focus();
                    swal("Vui lòng nhập mô tả cho sản phẩm", "", "error");
                    return false;
                }
                if (quantity.length === 0 || quantity === null) {
                    document.forms["UpdateProduct"]["txtQuantity"].focus();
                    swal("Vui lòng nhập số lượng sản phẩm", "", "error");
                    return false;
                }
                if (parseInt(quantity) < 0) {
                    document.forms["UpdateProduct"]["txtQuantity"].focus();
                    swal("Vui lòng nhập số lượng sản phẩm >= 0", "", "error");
                    return false;
                }
                return true;

            }
        </script>  
    </body>

</html>
