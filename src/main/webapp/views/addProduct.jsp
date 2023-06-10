<%@ page import="productInfo.Product" %>
<%@ page import="productInfo.ProductDAO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>등록된 상품 목록</title>
    <link rel="stylesheet" type="text/css" href="../css/productReg.css">
</head>
<body>
    <h2>등록된 상품 목록</h2>
    <table>
        <tr>
            <th>상품명</th>
            <th>가격</th>
            <th>수량</th>
            <th>카테고리</th>
            <th>상품 설명</th>
            <th>이미지</th>
        </tr>
        <c:forEach var="product" items="${productsList}">
            <tr>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.category}</td>
                <td>${product.description}</td>
                <td><img src="${product.imageUrl}" alt="Product Image" width="100px"></td>
            </tr>
        </c:forEach>
    </table>

    
    <br>
    <a href="/ProductController?action=ProductReg">다른 상품 등록하기</a>
</body>
</html>