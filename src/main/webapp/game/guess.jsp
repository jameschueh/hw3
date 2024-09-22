<%@ page import="com.systex.hw3.game.GuessGame" %>
<%@ page import="java.util.LinkedList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>猜數字遊戲</title>
</head>
<link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"></link>
<body>
    <h2>猜數字遊戲</h2>

    <% 
        GuessGame game = (GuessGame) session.getAttribute("game");
        if (game == null) {
            response.sendRedirect("gameController.do");
            return;
        }
        int remains = game.getRemains();
    %>

    <p>剩餘次數：<%= remains %></p>

    <% 
        LinkedList<String> errors = (LinkedList<String>) request.getAttribute("errors");
        if (errors != null && !errors.isEmpty()) { 
    %>
        <ul style="color: red;">
            <% for (String error : errors) { %>
                <li><%= error %></li>
            <% } %>
        </ul>
    <% } %>

    <% if (request.getAttribute("message") != null) { %>
        <p style="color: blue"><%= request.getAttribute("message") %></p>
    <% } %>

    <form action="gameController.do" method="POST">
        <label>Guess 1~10：</label>
        <input type="text" name="guess" />
        <input type="submit" value="提交" />
    </form>

</body>
</html>
