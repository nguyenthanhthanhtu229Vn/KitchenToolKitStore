<%-- 
    Document   : addProduct
    Created on : 14-03-2021, 15:35:32
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Account-KitchentToolStore</title>
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
                <div class="title">Đăng ký Sản phẩm</div>
                <div class="khung">
                    <form id="myform" name="AddNewProduct" action="AddNewProductController" enctype="multipart/form-data" method="POST">
                        <div class="user-details">
                            <div class="input-box">
                                <span class="details">Tên sản phẩm</span>
                                <input id="productName" form="myform" type="text" placeholder="Nhập tên sản phẩm" name="txtProductName" value="${param.txtProductName}"/>
                                <span class="details">Size</span><br />
                                <select name="cbxSize" id="">
                                    <option value="S">S</option>                               
                                    <option value="M">M</option>
                                    <option value="L">L</option>
                                    <option value="XL">XL</option>
                                </select><br />

                                <span class="details">Nhà sản xuất</span>
                                <input id="brand" form="myform" type="text" placeholder="Nhập tên nhãn hiệu" name="txtBrand" value="${param.txtBrand}" />
                                <span class="details">Giá</span>
                                <input id="price" form="myform" type="number" placeholder="Nhập giá" name="txtPrice" value="${param.txtPrice}" />
                                <span class="details">Mô tả sản phẩm</span>
                                <input id="description"  form="myform" class="area" type="text" placeholder="Mô tả sản phẩm" name="txtDescription" value="${param.txtDescription}" />
                                <span class="details">Số lượng sản phẩm</span>
                                <input id="quantity" form="myform" type="number" placeholder="Số lượng sản phẩm"  name="txtQuantity" value="${param.txtQuantity}"/>
                                <span class="details">Loại sản phẩm</span><br />
                                <select form="myform" name="cbxItem" id="">
                                    <c:forEach var="dtoItem" items="${requestScope.LISTITEMSINADMIN}">
                                        <option value="${dtoItem.itemsID}">${dtoItem.itemsName}</option>                              
                                    </c:forEach>
                                </select><br />                                
                            </div>
                        </div>                              
                    </form>                          
                    <br/>
                    <h2 style="text-align: center;">Chọn hình ảnh cho sản phẩm</h2>
                    <div class="container1">
                        <div class="wrapper">
                            <div class="image">
                                <img id="img1"src="">
                            </div>
                            <div class="content">
                                <div class="icon">
                                    <i class="fas fa-cloud-upload-alt"></i>
                                </div>
                                <div class="text">
                                    No file chosen, yet!</div>
                            </div>
                            <div id="cancel-btn">
                                <i class="fas fa-times"></i>
                            </div>
                            <div class="file-name">
                                File name here</div>
                        </div>
                        <button onclick="defaultBtnActive()" id="custom-btn"> Thêm hình </button>

                        <input form="myform" name="txtImageURL" id="default-btn" type="file" multiple="multiple" hidden="">           
                    </div>               
                    <input type="submit" onclick="return validateInput()" form="myform" name="action" value="AddNewProduct"class="buttonn"/>                  
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

        <script>
            const wrapper = document.querySelector(".wrapper");
            const fileName = document.querySelector(".file-name");
            const defaultBtn = document.querySelector("#default-btn");
            const customBtn = document.querySelector("#custom-btn");
            const cancelBtn = document.querySelector("#cancel-btn i");
            const img = document.querySelector("#img1");
            let regExp = /[0-9a-zA-Z\^\&\'\@\{\}\[\]\,\$\=\!\-\#\(\)\.\%\+\~\_ ]+$/;
            function defaultBtnActive() {
                defaultBtn.click();
            }
            defaultBtn.addEventListener("change", function () {
                const file = this.files[0];
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function () {
                        const result = reader.result;
                        img.src = result;
                        wrapper.classList.add("active");
                    }
                    cancelBtn.addEventListener("click", function () {
                        img.src = null;
                        img.style.display = null;
                        img.return
                        wrapper.classList.remove("active");
                    })
                    reader.readAsDataURL(file);
                }
                if (this.value) {
                    let valueStore = this.value.match(regExp);
                    fileName.textContent = valueStore;
                }
            });

        </script>

        <script>
            function validateInput() {
                var productName = document.getElementById("productName").value.trim();
                var brand = document.getElementById("brand").value.trim();
                var price = document.getElementById("price").value.trim();
                var quantity = document.getElementById("quantity").value.trim();
                var description = document.getElementById("description").value.trim();
                if (productName.length === 0 || productName === null) {
                    document.forms["AddNewProduct"]["txtProductName"].focus();
                    swal("Vui lòng nhập tên sản phẩm!", "", "error");
                    return false;
                }
                if (brand.length === 0 || brand === null) {
                    document.forms["AddNewProduct"]["txtBrand"].focus();
                    swal("Vui lòng nhập tên nhà sản xuất", "", "error");
                    return false;
                }
                if (price.length === 0 || price === null) {
                    document.forms["AddNewProduct"]["txtPrice"].focus();
                    swal("Vui lòng nhập giá sản phẩm", "", "error");
                    return false;
                }
                if (parseFloat(price) <= 0) {
                    document.forms["AddNewProduct"]["txtPrice"].focus();
                    swal("Vui lòng nhập giá sản phẩm > 0", "", "error");
                    return false;
                }
                if (description.length === 0 || description === null) {
                    document.forms["AddNewProduct"]["txtDescription"].focus();
                    swal("Vui lòng nhập mô tả cho sản phẩm", "", "error");
                    return false;
                }
                if (quantity.length === 0 || quantity === null) {
                    document.forms["AddNewProduct"]["txtQuantity"].focus();
                    swal("Vui lòng nhập số lượng sản phẩm", "", "error");
                    return false;
                }
                if (parseInt(quantity) <= 0) {
                    document.forms["AddNewProduct"]["txtQuantity"].focus();
                    swal("Vui lòng nhập số lượng sản phẩm > 0", "", "error");
                    return false;
                }
                return true;

            }
        </script>    
    </body>

</html>


