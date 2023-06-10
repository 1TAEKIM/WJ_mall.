<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>���θ� ���� ������</title>
    <style>
        /* CSS ��Ÿ���� ���⿡ �߰����ּ��� */
    </style>
</head>
<body>
    <header>
        <h1>���θ� �ΰ�</h1>
        <nav>
            <ul>
                <li><a href="#">Ȩ</a></li>
                <li><a href="#">��ǰ</a></li>
                <li><a href="#">��ٱ���</a></li>
                <li><a href="#">�ֹ�</a></li>
                <li><a href="#">������</a></li>
            </ul>
        </nav>
    </header>
    
    <main>
        <section>
            <h2>�α� ��ǰ</h2>
            <%-- JSP �ڵ带 ���⿡ �߰����ּ��� --%>
<%--             <% 
                // �α� ��ǰ �����ͺ��̽����� �������� ����
                List<Product> popularProducts = productDAO.getPopularProducts();
                
                for (Product product : popularProducts) {
                    %>
                    <div class="product">
                        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                        <h3><%= product.getName() %></h3>
                        <p><%= product.getPrice() %>��</p>
                    </div>
                    <%
                }
            %> --%>
        </section>
        
        <section>
            <h2>�Ż�ǰ</h2>
<%--             JSP �ڵ带 ���⿡ �߰����ּ���
            <% 
                // �Ż�ǰ �����ͺ��̽����� �������� ����
                List<Product> newProducts = productDAO.getNewProducts();
                
                for (Product product : newProducts) {
                    %>
                    <div class="product">
                        <img src="<%= product.getImageUrl() %>" alt="<%= product.getName() %>">
                        <h3><%= product.getName() %></h3>
                        <p><%= product.getPrice() %>��</p>
                    </div>
                    <%
                }
            %> --%>
        </section>
    </main>
    
    <footer>
        <p>���۱� ���� �� ��Ÿ ����</p>
    </footer>
</body>
</html>
