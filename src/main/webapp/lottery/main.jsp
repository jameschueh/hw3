<%@page import="java.util.LinkedList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>抽獎輸入</title>
</head>
<link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"></link>
<body>
    <h2>抽獎輸入</h2>

	<%--Start Error Report --%>
	<% LinkedList<String> errors = (LinkedList<String>)request.getAttribute("errors"); %>
	<% if (errors != null) { %>
		<ul style="color: red; font-size: 0.8em">
		<table border="0" style="margin:auto ;text-align: left">
			<% for (String error : errors) { %>
				<tr><td><li><%= error%></td><tr>
			<% } %>
		</table>
		</ul>
	<% } %>
	<%--End Error Report --%>
	<form action="lotteryController.do" method="POST">
		<table border="0" style="margin: auto; text-align: left">
            <tbody>
                <tr>
                    <td>組數</td>
                    <td><input type="text" name="groups" value ="${ param.groups }" /></td>
                </tr>
                <tr>
                    <td>排除</td>
                    <td><input type="text" name="exclude" value ="${ param.exclude }" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <input type="reset" value="重設">
                        <input type="submit" value="送出">
                    </td>
                </tr>
            </tbody>
        </table><br />
    </form>
</body>
</html>