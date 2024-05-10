<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-09
  Time: 오후 5:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
Cookie cookies[] = request.getCookies();
for(int i=0; i<cookies.length;i++){
    out.println(cookies[i].getName()+":"+cookies[i].getValue());
}
%>
</body>
</html>
