<%@ page import="productInfo.Product" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>WJ_mail 상품 등록</title>
    <link rel="stylesheet" type="text/css" href="../css/productReg.css">
    <link rel="stylesheet" type="text/css" href="../css/category.css">
</head>
<body>
<a href="main.jsp" id="logo"><img src="picture/logo.jpg"></a>
   <hr>
<div id="container">
    <div id="buttons" class="text_align_right">
        <a href="joinMembership.jsp">회원가입</a>/<a href="login.jsp">로그인</a>/<a href="myPage.jsp">마이페이지</a>/
        <a href="customerCenter.jsp">고객센터</a>
    </div>
    <br>
    <div id="search">
        <input type="text" name="search" placeholder="검색어를 입력하세요">
        <button type="button">검색</button>
    </div>
    <div id="maincategory">
   		<a href="main.jsp" class="category-link">
    	<span class="category-text">메인페이지</span>
		</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="productList.jsp">상품목록</a>
	</div>
	
    <h1>상품 등록</h1>
    <form action ="/ProductController?action=addProduct" method="POST" enctype="multipart/form-data">
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

        <input type="submit" value="등록">
    </form>
    </div>
</body>
</html>