<%@ page import="joinMembership.JoinMembershipDAO" %>
<%@ page import="joinMembership.JoinMembership" %>
<%@ page import="java.util.List" %>
<%
JoinMembershipDAO joinMembershipDAO = new JoinMembershipDAO();
List<JoinMembership> userList = joinMembershipDAO.getAllUsers();
request.setAttribute("users", userList);
%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Main</title>
    <link rel="stylesheet" type="text/css" href="../css/adminmage.css">
    <link rel="stylesheet" type="text/css" href="../css/category.css">
</head>
<body>
    <a href="main.jsp" id="logo"><img src="../css/wj_logo.png"></a>
    <table>
    <h2>Admin Main</h2>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Permission</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${users}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.address}</td>
                <td>${user.permission}</td>
                <td>
                    <form action="/UpdatePermissionController" method="POST">
                        <input type="hidden" name="id" value="${user.id}">
                        <select name="permission">
                            <option value="true" ${user.permission == 'true' ? 'selected' : ''}>True</option>
                            <option value="false" ${user.permission == 'false' ? 'selected' : ''}>False</option>
                        </select>
                        <button type="submit">Update</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
