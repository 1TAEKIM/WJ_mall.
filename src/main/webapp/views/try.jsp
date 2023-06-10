<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>쇼핑몰 메인 페이지</title>
    <style>
        /* CSS 스타일을 여기에 추가해주세요 */
    </style>
</head>
<body>
    <header>
        <h1>쇼핑몰 로고</h1>
        <nav>
            <ul>
                <li><a href="#">홈</a></li>
                <li><a href="#">상품</a></li>
                <li><a href="#">장바구니</a></li>
                <li><a href="#">주문</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <section>
            <h2>인기 상품</h2>
            <%-- JSP 코드를 여기에 추가해주세요 --%>
<%--             <% 
                // 인기 상품 데이터베이스에서 가져오기 예시
                List<Product> popularProducts = productDAO.getPopularProducts();
                
                for (Product product : popularProducts) {
                    %>
                    <div class="product">
                        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                        <h3><%= product.getName() %></h3>
                        <p><%= product.getPrice() %>원</p>
                    </div>
                    <%
                }
            %> --%>
        </section>
        
        <section>
            <h2>신상품</h2>
<%--             JSP 코드를 여기에 추가해주세요
            <% 
                // 신상품 데이터베이스에서 가져오기 예시
                List<Product> newProducts = productDAO.getNewProducts();
                
                for (Product product : newProducts) {
                    %>
                    <div class="product">
                        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                        <h3><%= product.getName() %></h3>
                        <p><%= product.getPrice() %>원</p>
                    </div>
                    <%
                }
            %> --%>
        </section>
    </main>
    
    <footer>
        <p>저작권 정보 및 기타 내용</p>
    </footer>
</body>
</html>
