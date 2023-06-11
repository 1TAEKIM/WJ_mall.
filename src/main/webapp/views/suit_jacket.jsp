<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="productInfo.Product" %>
<%@ page import="productInfo.ProductDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>WJ_mail 정장 재킷</title>
    <!-- <link rel="stylesheet" type="text/css" href="../css/mainPage.css"> -->
    <link rel="stylesheet" type="text/css" href="../css/category.css">
    <link rel="stylesheet" type="text/css" href="../css/products_list.css">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
   <a href="main.jsp" id="logo">WJ_mall</a>
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
    <div id="contents">
     
        <%
            // ProductDAO 인스턴스 생성
            ProductDAO productDAO = new ProductDAO();

     		// products 테이블에서 "정장 세트" 카테고리의 제품 목록 가져오기
        	List<Product> productList = productDAO.getAllProductsByCategory("정장 재킷");
            
     		// 모든 상품 리스트 가져오기
     		//List<Product> productList = productDAO.getAllProducts();
     		
     		
     		// 한 줄에 표시할 제품 수 설정
            int itemsPerRow = 3;

            // 제품 목록을 블록 형식으로 표시
                out.println("<div id=\"wrapper\">"); // wrapper 추가
            for (int i = 0; i < productList.size(); i++) {
                Product product = productList.get(i);
                if (i % itemsPerRow == 0) {
                    // 새로운 줄 시작
                    out.println("<div class=\"row\">");
                }
                // 제품 블록 생성
                
                out.println("<div class=\"card\">");
                out.println("<header>" + product.getName() + "</header>"); // header 추가
                out.println("<img class=\"product_image\" src=\"" + product.getImageUrl() + "\">");
                out.println("<p>" + product.getDescription() + "</p>");
                out.println("<p>" + product.getPrice() + "원</p>");
                out.println("</div>");
                
                if (i % itemsPerRow == itemsPerRow - 1 || i == productList.size() - 1) {
                    // 줄 끝
                    out.println("</div>");
                }
            }
            out.println("</div>");
        %>
        </div>
    </div>
    <div id="footer">
        부가 정보
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