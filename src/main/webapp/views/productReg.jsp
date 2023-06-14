<%@ page import="productInfo.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="joinMembership.JoinMembership" %>
<!DOCTYPE html>
<html>
<head>
    <title>WJ_mail 상품 등록</title>
    <link rel="stylesheet" type="text/css" href="../css/productReg.css">
    <link rel="stylesheet" type="text/css" href="../css/category.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
   <a href="main.jsp" id="logo"><img src="../css/wj_logo.png" class="logo-image"></a>
<div id="container">
	
    <form action ="/ProductController?action=addProduct" method="POST" enctype="multipart/form-data">
    <h2>상품 등록</h2>
        <label for="category">카테고리:</label>
        <!-- <input type="text" id="category" name="category" required><br><br> -->
        <select id="category" name="category" required>
            <option value="정장 세트">정장 세트</option>
            <option value="정장 바지">정장 바지</option>
            <option value="정장 재킷">정장 재킷</option>
            <option value="정장 조끼">정장 조끼</option>
        </select><br><br>

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

        <div class="table-actions">
		<button type="submit">등록</button>
		</div>
    </form>
    </div>
</body>
</html>