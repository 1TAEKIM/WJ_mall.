<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="joinMembership.JoinMembership" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" type="text/css" href="../css/find_id.css">
    <link rel="stylesheet" type="text/css" href="../css/category.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
    <a href="main.jsp" id="logo"><img src="../css/wj_logo.png"></a>
    
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
    
    <div id="regform">
        <form name="form1" action="/FindIdController" method="POST">
            <h2>아이디 찾기</h2>
            <hr>
            <label>이름</label><br>
            <input type="text" name="name" size="40"><br>
            <label>비밀번호</label><br>
            <input type="password" name="password" size="40"><br>
            <button type="submit" class="button">찾기</button>
        
        
         <% 
            String message = (String) request.getAttribute("message");
            if (message != null && !message.isEmpty()) {
        %>
            <p class="error-message"><%= message %></p>
        <% } %>
        </form>
    </div>
</body>
</html>
