<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="joinMembership.JoinMembership" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" type="text/css" href="../css/find_pw.css">
    <link rel="stylesheet" type="text/css" href="../css/category.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
    <a href="../views/main.jsp" id="logo"><img src="../css/wj_logo.png"></a>
    
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
    
    <div id="fwform">
    	<form action="/FindPwController" method="post">
        <h2>비밀번호 찾기</h2>
        <hr>
            <label>아이디:</label><br>
            <input type="text" name="id" required><br>
            <button type="submit" class="button">비밀번호 확인</button>
        <p>${message}</p>
        <a href="../views/find_id.jsp" class="button">아이디 찾기로 돌아가기</a>
        </form>
    </div>
</body>
</html>
