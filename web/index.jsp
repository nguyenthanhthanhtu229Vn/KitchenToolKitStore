<%@page import="admin.dtos.ProductDTO"%>
<%@page import="admin.dtos.OrderDetailDTO"%>
<%@page import="java.util.List"%>
<%@page import="admin.dtos.ProductDetailDTO"%>
<%@page import="daos.AdminDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<html>
    <head>
        <meta http - equiv =  "Content-Type"  content =  "text/html; charset=ISO-8859-1" >
        <title> FusionCharts | My First Chart </title> <script type = "text/javascript"
        src = "https://cdn.fusioncharts.com/fusioncharts/latest/fusioncharts.js"> </script> <script type = "text/javascript"
        src = "https://cdn.fusioncharts.com/fusioncharts/latest/themes/fusioncharts.theme.fusion.js"> </script> 
    <link rel="stylesheet" href="css/newcss4.css">
    <body>
        <%@include file="header.jsp" %>
        <div id =  "chart" > </div>
        <%
            // store chart config name-config value pair
            AdminDAO dao = new AdminDAO();
            List<ProductDetailDTO> listProductName = dao.showProductNameChart();
            List<OrderDetailDTO> listQuantiy = dao.loadQuantiyChart();
            OrderDetailDTO dto = null;
    
            Map<String, String> chartConfig = new HashMap<String, String>();
            chartConfig.put("caption", "Sản phẩm được bán nhiều nhất trong 1 tháng");
            chartConfig.put("subCaption", "Số lương/1 tháng");
            chartConfig.put("xAxisName", "Sản phẩm");
            chartConfig.put("yAxisName", "Loại");
            chartConfig.put("numberSuffix", " cái");
            chartConfig.put("theme", "fusion");
            //store label-value pair
            Map<String, Integer> dataValuePair = new HashMap<String, Integer>();
            for (ProductDetailDTO name : listProductName) {
                for (OrderDetailDTO quantiy : listQuantiy) {
                    if (name.getProductDetailID().equals(quantiy.getProductDetail().getProductDetailID())) {
                        
                        dataValuePair.put(name.getProduct().getProductName(),quantiy.getQuantity());
                       
                    }
                }
            }
            System.out.println(listProductName.get(1).getProduct().getProductName());
            System.out.println(dataValuePair.get("Cha?o"));
//            dataValuePair.put("Venezuela", 13);
//            dataValuePair.put("Saudi", 260);
//            dataValuePair.put("Canada", 180);
//            dataValuePair.put("Iran", 140);
//            dataValuePair.put("Russia", 115);
//            dataValuePair.put("UAE", 100);
//            dataValuePair.put("US", 30);
//            dataValuePair.put("China", 30);
            StringBuilder jsonData = new StringBuilder();
            StringBuilder data = new StringBuilder();
            // json data to use as chart data source
            jsonData.append("{'chart':{");
            for (Map.Entry conf : chartConfig.entrySet()) {
                jsonData.append("'" + conf.getKey() + "':'" + conf.getValue() + "',");
            }
            jsonData.replace(jsonData.length() - 1, jsonData.length(), "},");
            // build  data object from label-value pair
            data.append("'data':[");
            for (Map.Entry pair : dataValuePair.entrySet()) {
                data.append("{'label':'" + pair.getKey() + "','value':'" + pair.getValue() + "'},");
            }
            data.replace(data.length() - 1, data.length(), "]");
            jsonData.append(data.toString());
            jsonData.append("}");
            // Create chart instance
            // charttype, chartID, width, height,containerid, data format, data
            fusioncharts.FusionCharts firstChart = new fusioncharts.FusionCharts(
                    "column2d",
                    "first_chart",
                    "700",
                    "400",
                    "chart",
                    "json",
                    jsonData.toString()
            );
        %>
        <%= firstChart.render()%> 
        <%@include file="footer.jsp" %>
        </body> </html>