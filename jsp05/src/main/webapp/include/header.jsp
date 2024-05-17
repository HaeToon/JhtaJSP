<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.heo96.jsp05.utils.CookieManager" %>
<%
    String loggedID=(String)session.getAttribute("userID");
    String loggedName=(String)session.getAttribute("userName");
%>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/sign-in.css" rel="stylesheet">
    <link href="../css/common.css" rel="stylesheet">
    <script src="../js/bootstrap.bundle.min.js"></script>
    <script src="../js/jquery-3.7.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <div class="container">
        <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
            <div class="col-md-3 mb-2 mb-md-0">
                <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
                    <svg class="bi" width="40" height="32" role="img" aria-label="Bootstrap">
                        <use xlink:href="#bootstrap"></use>
                    </svg>
                </a>
            </div>

            <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                <li><a href="../index/index.jsp" class="nav-link px-2 link-secondary">Home</a></li>
                <%if(loggedID!=null) {%>
                <li><a href="../board/list.jsp" class="nav-link px-2">Board</a></li>
                <%}%>
                <li><a href="../board/faq.jsp" class="nav-link px-2">FAQs</a></li>
            </ul>


           <% if(loggedID!=null){ %>
            <div class="col-md-3 text-end">
                <a href="../member/info.jsp" class="btn btn-outline-primary me-2"><%=loggedName%></a>
                <%--                <a href="../member/insert-member.jsp" class="btn btn-primary">Sign-up</a>--%>
                <a href="../member/logout.jsp" class="btn btn-primary">로그아웃</a>
            </div>
           <% } else { %>
            <div class="col-md-3 text-end">
                <a href="../member/login.jsp" class="btn btn-outline-primary me-2">로그인</a>
                <a href="../member/insert-member.jsp" class="btn btn-primary">회원가입</a>
                <%--                <a href="../member/logout.jsp" class="btn btn-primary">LogOut</a>--%>
            </div>
          <%  } %>
        </header>
    </div>
</head>
<body>
