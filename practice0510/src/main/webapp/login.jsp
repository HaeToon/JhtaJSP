<%@ page import="com.heo96.practice0510.utils.CookieManager" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 4:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String isSaved = CookieManager.readCookie(request,"savedID");
    String isChecked="";
    if(!isSaved.equals("")){
        isChecked="checked";
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>로그인</h2>
    <form action="login-member-process.jsp" method="post">
        <div>
            <label>
                <span>아이디</span>
                <input type="text" name="userID" placeholder="아이디 입력" value="<%=isSaved%>">
            </label>
            <label>
                <span>아이디 저장</span>
                <input type="checkbox" name="saveID" value="saved" <%=isChecked%>>
            </label>
        </div>
        <div>
            <label>
                <span>비밀번호</span>
                <input type="password" name="userPW" placeholder="비밀번호 입력">
            </label>
        </div>
        <button>로그인</button>
        <button type="button" onclick="location.href='index.jsp'">홈으로</button>
    </form>
</body>
</html>
