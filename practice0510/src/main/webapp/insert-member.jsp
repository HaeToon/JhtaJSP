<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 4:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>회원가입</h2>
    <form action="insert-member-process.jsp" method="post">
        <div>
            <label>
                <span>아이디</span>
                <input type="text" name="userID">
            </label>
        </div>
        <div>
            <label>
                <span>비밀번호</span>
                <input type="password" name="userPW">
            </label>
        </div>
        <div>
            <label>
                <span>이름</span>
                <input type="text" name="userName">
            </label>
        </div>
        <div>
            <label>
                <span>생일</span>
                <input type="date" name="userBirth">
            </label>
        </div>
        <button>회원가입</button>
        <button type="button" onclick="location.href='index.jsp'">홈으로</button>
    </form>
</body>
</html>
