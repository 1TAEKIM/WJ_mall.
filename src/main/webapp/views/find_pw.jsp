<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 찾기</title>
    <link rel="stylesheet" type="text/css" href="../css/find_pw.css">
</head>
<body>
    <a href="../views/main.jsp" id="logo"><img src="../css/wj_logo.jpg"></a>
    <hr>
    <div id="pwform">
        <h2>비밀번호 찾기</h2>
        <form action="/FindPwController" method="post">
            <label>아이디:</label><br>
            <input type="text" name="id" required><br>
            <input type="submit" value="비밀번호 확인" class="button">
        </form>
        <p>${message}</p>
        <a href="../views/find_id.jsp" class="button">아이디 찾기로 돌아가기</a>
    </div>
</body>
</html>
