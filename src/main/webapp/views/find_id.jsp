<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <link rel="stylesheet" type="text/css" href="../css/find_id.css">
</head>
<body>
    <a href="main.jsp" id="logo"><img src="../css/wj_logo.jpg"></a>
    <hr>
    <div id="regform">
        <form name="form1" action="/FindIdController" method="POST">
            <h2>아이디 찾기</h2>
            <label>이름</label><br>
            <input type="text" name="name" size="40"><br>
            <hr>
            <label>비밀번호</label><br>
            <input type="password" name="password" size="40"><br>
            <button type="submit" class="button">찾기</button>
        </form>
        
         <% 
            String message = (String) request.getAttribute("message");
            if (message != null && !message.isEmpty()) {
        %>
            <p class="error-message"><%= message %></p>
        <% } %>
    </div>
</body>
</html>
