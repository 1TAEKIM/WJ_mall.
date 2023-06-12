<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 확인</title>
    <link rel="stylesheet" type="text/css" href="../css/display_pw.css">
</head>
<body>
    <a href="../views/main.jsp" id="logo"><img src="../css/wj_logo.jpg"></a>
    <hr>
    <div id="pwform">
        <h2>비밀번호 확인</h2>
        <% if (request.getAttribute("password") != null) { %>
            <label>아이디:</label><br>
            <p><%= request.getAttribute("id") %></p>
            <hr>
            <label>비밀번호:</label><br>
            <p><%= request.getAttribute("password") %></p>
        <% } else { %>
            <p><%= request.getAttribute("message") %></p>
        <% } %>
        <a href="../views/find_id.jsp" class="button">아이디 찾기로 돌아가기</a>
    </div>
</body>
</html>
