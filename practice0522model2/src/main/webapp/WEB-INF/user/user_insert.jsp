<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-24
  Time: 오후 4:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
    <form action="/user/user-insert" method="post">
        <div>
            <p>아이디</p>
            <input type="text" name="userID">
        </div>
        <div>
            <p>비밀번호</p>
            <input type="password" name="userPW">
        </div>
        <div>
            <p>이름</p>
            <input type="text" name="userName">
        </div>
        <div>
            <p>생일</p>
            <input type="date" name="userBirth">
        </div>
        <div>
            <p>이메일</p>
            <input type="text" name="userEmail">
        </div>
        <div>
            <p>우편번호</p>
            <input type="text" name="userPostCode">
        </div>
        <div>
            <p>주소</p>
            <input type="text" name="userAdress">
        </div>
        <div>
            <p>상세주소</p>
            <input type="text" name="userDetailAdress">
        </div>
        <div>
            <p>프로필</p>
            <input type="text">
        </div>
        <button>회원가입</button>
        <button type="reset">리셋</button>
    </form>
<%@include file="../include/footer.jsp"%>
