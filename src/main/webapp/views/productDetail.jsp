<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="productInfo.Product" %>
<%@ page import="productInfo.ProductDAO" %>
<%@ page import="joinMembership.JoinMembership" %>
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
    <link rel="stylesheet" type="text/css" href="../css/mainPage.css">
    <link rel="stylesheet" type="text/css" href="../css/category.css">
    <link rel="stylesheet" type="text/css" href="../css/products_list.css">
    <link rel="stylesheet" type="text/css" href="../css/productDetail.css">
</head>
<body>
<a href="main.jsp" id="logo"><img src="../css/wj_logo.png" class="logo-image"></a>
<div id="container">
    <div id="buttons" class="text_align_right">
    <% if (session.getAttribute("user") != null) { %>
        <% JoinMembership user = (JoinMembership) session.getAttribute("user"); %>
        <% if (user.getPermission().equals("true")) { %>
            <a href="admin_mage.jsp">회원 관리</a>/<a href="product_mage.jsp">상품 관리</a>/<a href="/JoinMembershipController?logout=true">로그아웃</a>
        <% } else { %>
            <a href="/JoinMembershipController?logout=true">로그아웃</a>
        <% } %>
    <% } else { %>
        <a href="joinMembership.jsp">회원가입</a>/<a href="login.jsp">로그인</a>
    <% } %>
</div>
</div>
<br>
        <div id="maincategory">
   		<a href="main.jsp" class="category-link">
    	<span class="category-text">메인페이지</span></a>
    	&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="suit_set.jsp">정장 세트</a>
    	&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="suit_jean.jsp">정장 바지</a>
    	&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="suit_jacket.jsp">정장 재킷</a>
    	&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="suit_vest.jsp">정장 조끼</a>
	</div>
    <br>
    <div class="product-box">
  <h2><%= product.getName() %></h2>
  <p><h3>Price: <%= product.getPrice() %></h3></p>
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
        <p>죄송합니다! 상품 재고가 없습니다.</p>
    <% } %>
</div>
    <%-- Display other product details as needed --%>
</body>
</html>
