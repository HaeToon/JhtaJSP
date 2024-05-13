<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.heo96.jsp05.utils.CookieManager" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
    <link href="css/sign-in.css" rel="stylesheet">
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
                <li><a href="index.jsp" class="nav-link px-2 link-secondary">Home</a></li>
                <li><a href="notice.jsp" class="nav-link px-2">Notice</a></li>
                <li><a href="board.jsp" class="nav-link px-2">Board</a></li>
                <li><a href="faq.jsp" class="nav-link px-2">FAQs</a></li>
                <li><a href="about.jsp" class="nav-link px-2">About</a></li>
                <li><a href="info.jsp" class="nav-link px-2">Info</a></li>
            </ul>

            <div class="col-md-3 text-end">
                <a href="login.jsp" class="btn btn-outline-primary me-2">Login</a>
                <a href="insert-member.jsp" class="btn btn-primary">Sign-up</a>
                <a href="logout.jsp" class="btn btn-primary">LogOut</a>
            </div>
        </header>
    </div>
</head>
<body>