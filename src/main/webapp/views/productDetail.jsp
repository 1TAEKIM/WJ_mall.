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

    // Retrieve the message attribute from the request
    String message = (String) request.getAttribute("message");
    // Retrieve the error attribute from the request
    String error = (String) request.getAttribute("error");
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

    <%-- Display the message if it exists --%>
    <% if (message != null) { %>
        <p style="color: green;"><%= message %></p>
    <% } %>

    <%-- Display the error if it exists --%>
    <% if (error != null) { %>
        <p style="color: red;"><%= error %></p>
    <% } %>

    <%-- Display the purchase form if the product has quantity available --%>
    <% if (product.getQuantity() > 0) { %>
        <form action="/ProductController?action=purchaseProduct" method="post">
            <label for="quantity">Quantity:</label>
            <input type="number" name="quantity" id="quantity" required>
            <input type="hidden" name="productNum" value="<%= product.getProductNum() %>">
            <input type="submit" value="Purchase">
        </form>
    <% } else { %>
        <p>Sorry, this product is currently out of stock.</p>
    <% } %>

    <%-- Display other product details as needed --%>
</body>
</html>
