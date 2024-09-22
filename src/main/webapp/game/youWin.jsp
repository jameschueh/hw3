<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>成功</title>
</head>
<link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"></link>
<body>
    <h2>恭喜猜中了</h2>
    <a href="../index.jsp">返回首頁</a>
    <% session.invalidate(); %>
</body>
</html>