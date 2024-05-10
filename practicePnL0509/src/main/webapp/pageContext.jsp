<%@ page import="com.heo96.practicepnl0509.dto.Person" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-09
  Time: 오후 4:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
pageContext.setAttribute("pageContextInt",100);
pageContext.setAttribute("pageContextString","heo96");
pageContext.setAttribute("pageContextPerson",new Person("태훈",30));

int pageContextInt =(int)pageContext.getAttribute("pageContextInt");
String pageContextString = (String)pageContext.getAttribute("pageContextString");
Person pageContextPerson =(Person)pageContext.getAttribute("pageContextPerson");
%>
<h1><%=pageContextInt%></h1>
<h1><%=pageContextString%></h1>
<h1><%=pageContextPerson.getName()%></h1>
<h1><%=pageContextPerson.getAge()%></h1>

<%
response.sendRedirect("second.jsp");
%>
</body>
</html>
