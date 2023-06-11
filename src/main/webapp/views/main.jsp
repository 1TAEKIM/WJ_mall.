<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>WJ_mail</title>
    <link rel="stylesheet" type="text/css" href="../css/mainPage.css">
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
    	<span class="category-text">메인페이지</span></a>
    	&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="suit_set.jsp">정장 세트</a>
    	&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="suit_jean.jsp">정장 바지</a>
    	&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="suit_jacket.jsp">정장 재킷</a>
    	&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="suit_vest.jsp">정장 조끼</a>
	</div>
    <br>
    <div id="main_content">
        상품 이미지/정보
    </div>
    <div id="footer">
        부가 정보
    </div>
</div>
<script>
    document.querySelector('a[href="joinMembership.jsp"]').addEventListener('click', function(event) {
        event.preventDefault();
        window.location.href = "joinMembership.jsp";
    });
    document.querySelector('a[href="login.jsp"]').addEventListener('click', function(event) {
        event.preventDefault();
        window.location.href = "login.jsp";
    });
    document.querySelector('a[href="myPage.jsp"]').addEventListener('click', function(event) {
        event.preventDefault();
        window.location.href = "myPage.jsp";
    });
    document.querySelector('a[href="customerCenter.jsp"]').addEventListener('click', function(event) {
        event.preventDefault();
        window.location.href = "customerCenter.jsp";
    });
</script>
</body>
</html>