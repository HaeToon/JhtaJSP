<%@ page import="com.heo96.jsp03.dto.Person" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-09
  Time: 오전 9:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //setAttribute에는 뭐든 담을수있다. 끄집어 낼때는 반드시 형변환이 필요하다.
    pageContext.setAttribute("pageContextInt", 100);
    pageContext.setAttribute("pageContextString", "heo96");
    pageContext.setAttribute("pageContextPerson", new Person("허태훈", 30));
    request.setAttribute("requestString", "heo961");
    session.setAttribute("sessionString","Heo9610");
    session.setAttribute("sessionPerson",new Person("허태훈", 30));
    //로그인했을때 많이쓴다.
    //application > session > request > pageContext

    int pageContextInt = (int)pageContext.getAttribute("pageContextInt");
    String pageContextString = (String)pageContext.getAttribute("pageContextString");
    Person pageContextPerson = (Person)pageContext.getAttribute("pageContextPerson");
    //getAttribute 할때 return 값은 object이므로 형변환해서 써야한다.
%>
<h1><%= pageContextInt %></h1>
<h1><%= pageContextString %></h1>
<h1><%= pageContextPerson.getName() %></h1>
<h1><%= pageContextPerson.getAge() %> </h1>
<%
    //jsp를 veiw로 사용할때 쓰는방법.
    //request 에 실린 값은 foreward로 페이지 바뀔때만 한번 넘길수있다.
//    request.getRequestDispatcher("second.jsp").forward(request,response); //rquest의 주소를 갖지만 내용은 response를가짐.
    response.sendRedirect("second.jsp"); //주소자체가 바뀜 , data는 못보냄
%>
</body>
</html>
