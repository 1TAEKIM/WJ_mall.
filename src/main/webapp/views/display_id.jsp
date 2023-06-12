<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="joinMembership.JoinMembershipDAO" %>
<%@ page import="joinMembership.JoinMembership" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display ID</title>
</head>
<body>
    <h1>Display ID</h1>

    <%
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        JoinMembershipDAO dao = new JoinMembershipDAO();
        JoinMembership user = dao.findUserByNameAndPassword(name, password);

        if (user != null) {
            out.println("Your ID is: " + user.getId());
        } else {
            out.println("The information you entered does not exist!");
        }
    %>
</body>
</html>
