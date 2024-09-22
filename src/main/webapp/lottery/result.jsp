<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>抽獎結果</title>
</head>
<link href="<%= request.getContextPath() %>/style/myStyle.css" rel="stylesheet"></link>
<body>
    <h2>抽獎結果</h2>
    <table border="1" style="margin: auto">
        <thead>
            <tr>
                <th>組別</th>
                <th>抽獎號碼</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<int[]> results = (List<int[]>) request.getAttribute("results");
                for (int i = 0; i < results.size(); i++) {
                    int[] result = results.get(i);
            %>
                <tr>
                    <td>第 <%= (i + 1) %> 組</td>
                    <td>
                        <%
                            for (int num : result) {
                                out.print(num + " ");
                            }
                        %>
                    </td>
                </tr>
            <% } %>
        </tbody>
    </table><br>
    <a href="../index.jsp">返回首頁</a>
    <% session.invalidate(); %>
</body>
</html>
