<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="productInfo.Product" %>
<%@ page import="productInfo.ProductDAO" %>


<%@ page isELIgnored="false" %>


<%
    // Retrieve the productNum parameter from the URL
    int productNum = Integer.parseInt(request.getParameter("productNum"));

    // Fetch the product details from the database using ProductDAO
    ProductDAO productDAO = new ProductDAO();
    Product product = null;
    try {
        product = productDAO.getProduct(productNum);
    } catch (SQLException e) {
        e.printStackTrace();
        // Handle the error gracefully
        response.sendRedirect("../views/error.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Product Detail - ${product.name}</title>
</head>
<body>
    <h1><%= product.getName() %></h1>
<p>Price: <%= product.getPrice() %></p>
<p>Description: <%= product.getDescription() %></p>
 <img src="<%= product.getImageUrl() %>" alt="Product Image">

    <!-- Display other product details as needed -->
</body>
</html>
