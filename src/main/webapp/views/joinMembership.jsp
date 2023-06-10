<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WJ_mail 회원가입</title>
<link rel="stylesheet" type="text/css" href="../css/joinMembership.css">
</head>
<body>
   <a href="main.jsp" id="logo">WJ</a>
   <hr>
   <h2>회원가입</h2>
   <form id="signup-form" action="/JoinMembershipController" method="POST">
       <label for="name">이름:</label>
       <input type="text" id="name" name="name" required><br>

       <label for="id">아이디:</label>
       <input type="text" id="id" name="id" required><br>

       <label for="password">비밀번호:</label>
       <input type="password" id="password" name="password" required><br>

       <label for="address">주소:</label>
       <input type="text" id="address" name="address" required><br>

       <button type="submit">가입 완료</button>
       <button type="button" onclick="cancel()">취소</button>

   </form>
   <script>
   function cancel()
   {
      event.preventDefault(); // 기본 이벤트 처리 방지 (페이지 이동 막음)
       window.location.href = "main.jsp"; // 회원가입 페이지로 이동
   }
</script>
</body>
</html>