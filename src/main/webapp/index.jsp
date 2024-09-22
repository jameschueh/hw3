<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>首頁</title>
    <link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }
        table {
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <table>
        <tbody>
	        <td>
		        <a href="./lottery/main.jsp">lottery game</a>		        
		         | 
		        <a href="./game/guess.jsp">guess game</a> 		        
	        </td>
        </tbody>
    </table>
</body>
</html>
