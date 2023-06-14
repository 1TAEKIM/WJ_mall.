<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="joinMembership.JoinMembership" %>
<%@ page import="productInfo.Product" %>
<%@ page import="productInfo.ProductDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>WJ_mail</title>
    <link rel="stylesheet" type="text/css" href="../css/mainPage.css">
    <link rel="stylesheet" type="text/css" href="../css/category.css">
    <link rel="stylesheet" type="text/css" href="../css/products_list.css">
</head>
<body>
   <a href="main.jsp" id="logo"><img src="../css/wj_logo.png" class="logo-image"></a>
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
    <br>
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
        	//List<Product> productList = productDAO.getAllProductsByCategory("정장 재킷");
            
     		// 모든 상품 리스트 가져오기
     		List<Product> productList = productDAO.getAllProducts();
     		
     		
     		// 한 줄에 표시할 제품 수 설정
            int itemsPerRow = 5;

            // 제품 목록을 블록 형식으로 표시
                out.println("<div id=\"wrapper\">"); // wrapper 추가
            for (int i = 0; i < productList.size(); i++) {
                Product product = productList.get(i);
                if (i % itemsPerRow == 0) {
                    // 새로운 줄 시작
                    out.println("<div class=\"row\">");
                }
                // 제품 블록 생성
                
                //out.println("<div class=\"card\">");
                //out.println("<header><a href=\"productDetail.jsp?productNum=" + product.getProductNum() + "\">" + product.getName() + "</a></header>");
				out.println("<div class=\"card\" onclick=\"window.location.href='productDetail.jsp?productNum=" + product.getProductNum() + "'\">");
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
    <div id="footer">
        <p>(xxxooo) xx시 xx구 WJmall Tel. 000-000-0000</p>
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