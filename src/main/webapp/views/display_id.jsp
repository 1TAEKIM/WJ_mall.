<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="joinMembership.JoinMembershipDAO" %>
<%@ page import="joinMembership.JoinMembership" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display ID</title>
    <link rel="stylesheet" type="text/css" href="../css/display_pw.css">
    <link rel="stylesheet" type="text/css" href="../css/category.css">
    <link rel="stylesheet" type="text/css" href="../css/login.css">
</head>
<body>
<a href="../views/main.jsp" id="logo"><img src="../css/wj_logo.png"></a>
<br>
    <div id="pwform">
    	<form>
        <h2>아이디 확인</h2>
        <hr>
        <% if (request.getAttribute("name") != null && request.getAttribute("password") != null) { %>
            <label>이름:</label><br>
            <p><%= request.getAttribute("name") %></p>
            <label>비밀번호:</label><br>
            <p><%= request.getAttribute("password") %></p>
            <hr>
            <label>아이디:</label><br>
            <p><%= request.getAttribute("id") %></p>
        <% } else { %>
            <p><%= request.getAttribute("message") %></p>
        <% } %>
        </form>
    </div>
</body>
</html>
