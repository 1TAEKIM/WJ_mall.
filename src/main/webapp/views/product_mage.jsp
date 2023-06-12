<%@ page import="java.util.List" %>
<%@ page import="productInfo.Product" %>
<%@ page import="productInfo.ProductDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
   request.setCharacterEncoding("UTF-8");
   ProductDAO productDAO = new ProductDAO();
   List<Product> productList = productDAO.getAllProducts();
%>

<!DOCTYPE html>
<html>
<head>
   <title>Product Management</title>
   <meta charset="UTF-8">
</head>
<body>
   <h1>Product Management</h1> <br><a href="/ProductController?action=ProductReg">상품 등록하기</a>
   
   <!-- Display the product listings -->
   <table>
      <tr>
         <th>Product ID</th>
         <th>Category</th>
         <th>Name</th>
         <th>Price</th>
         <th>Description</th>
         <th>Quantity</th>
         <th>Image</th>
         <th></th>
      </tr>
      <% for (Product product : productList) { %>
         <tr>
            <td><%= product.getProductNum() %></td>
            <td><%= product.getCategory() %></td>
            <td><%= product.getName() %></td>
            <td><%= product.getPrice() %></td>
            <td><%= product.getDescription() %></td>
            <td><%= product.getQuantity() %></td>
            <td><img src="<%= product.getImageUrl() %>" alt="Product Image"></td>
            <%-- <td><%= product.getImageUrl() %></td> --%>
            <td>
               <!-- Form for modifying product attributes -->
               <form action="/ProductController" method="POST">
                  <input type="hidden" name="action" value="updateProduct">
                  <input type="hidden" name="product_num" value="<%= product.getProductNum() %>">
                  <!-- Include input fields for each attribute you want to modify -->
                  <!-- For example: -->
                  <input type="text" name="name" value="<%= product.getName().replaceAll("\"", "&quot;") %>" required>
                  <input type="text" name="price" value="<%= product.getPrice() %>" required>
                  <input type="submit" value="Update">
               </form>
            </td>
            <td>
               <!-- Delete button for removing the product -->
               <form action="/ProductController" method="POST">
                  <input type="hidden" name="action" value="deleteProduct">
                  <input type="hidden" name="product_num" value="<%= product.getProductNum() %>">
                  <input type="submit" value="Delete">
               </form>
            </td>
         </tr>
      <% } %>
   </table>
</body>
</html>
