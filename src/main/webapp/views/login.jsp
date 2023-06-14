<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WJ_mail 로그인</title>
<link rel="stylesheet" type="text/css" href="../css/login.css">
<link rel="stylesheet" type="text/css" href="../css/category.css">
</head>
<body>
   <a href="main.jsp" id="logo"><img src="../css/wj_logo.png"></a>
   <div id="regform">
      <form name="form1" action="/JoinMembershipController" method="GET">
         <h2>로그인</h2>
         <hr>
         <label>아이디</label><br>
         <input type="text" name="id" size="40"><br>
         <label>비밀번호</label><br>
         <input type="password" name="password" size="40"><br>
         <!-- <button type="submit" class="button" onclick="login()">로그인</button> -->
         <button type="submit" class="button">로그인</button>
         <button type="button" onClick="joinMem()" class="button">회원 가입</button>
         <br>
         <button type="button" onClick="findId()" class="button">아이디 찾기</button>
         <button type="button" onClick="findPassword()" class="button">비밀번호 찾기</button>
      </form>
      <div id="errorMessage" style="color: red;"></div>
      
   </div>
   <script>
   function joinMem() {
      event.preventDefault(); // 기본 이벤트 처리 방지 (페이지 이동 막음)
      window.location.href = "joinMembership.jsp"; // 회원가입 페이지로 이동
   }

   function findId() {
      event.preventDefault(); // 기본 이벤트 처리 방지 (페이지 이동 막음)
      window.location.href = "find_id.jsp"; // 아이디 찾기 페이지로 이동
   }

   function findPassword() {
      event.preventDefault(); // 기본 이벤트 처리 방지 (페이지 이동 막음)
      window.location.href = "find_pw.jsp"; // 비밀번호 찾기 페이지로 이동
   }
   
   </script>
</body>
</html>
