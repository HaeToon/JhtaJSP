<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-14
  Time: 오전 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%--pageContext는 적힌곳(el-test)에서만 나옴. --%>
<p>${pageScope.scope}</p>
<p>${requestScope.scope}</p>
<p>${sessionScope.scope}</p>
<p>${applicationScope.scope}</p>
<hr>
<p>${scope}</p>
</body>
</html>
