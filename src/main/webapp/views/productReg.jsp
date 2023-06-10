<%@ page import="productInfo.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>WJ_mail 상품 등록</title>
    <link rel="stylesheet" type="text/css" href="../css/productReg.css">
</head>
<body>
    <h1>상품 등록</h1>
    <form action ="/ProductController?action=addProduct" method="POST" enctype="multipart/form-data">
        <label for="category">카테고리:</label>
        <input type="text" id="category" name="category" required><br><br>

        <label for="name">상품명:</label>
        <input type="text" id="name" name="name" required><br><br>

        <label for="price">상품 가격:</label>
        <input type="number" id="price" name="price" required><br><br>

        <label for="description">상품 설명:</label>
        <textarea id="description" name="description" required></textarea><br><br>

        <label for="quantity">상품 수량:</label>
        <input type="number" id="quantity" name="quantity" required><br><br>

        <label for="imageUrl">이미지:</label>
        <input type="file" id="imageUrl" name="file" required><br><br>

        <input type="submit" value="등록">
    </form>
</body>
</html>