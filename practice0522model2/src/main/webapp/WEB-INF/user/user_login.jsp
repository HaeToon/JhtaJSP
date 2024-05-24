<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-24
  Time: 오후 4:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<title>로그인</title>
    <div>
        <form action="/user/user-login" method="post">
            <div>
                <p>아이디</p>
                <input type="text" name="userID">
            </div>
            <div>
                <p>비밀번호</p>
                <input type="text" name="userPW">
            </div>
            <button>로그인</button>
            <a href="">아이디찾기</a>
            <a href="">비밀번호찾기</a>
        </form>
    </div>
<%@ include file="../include/footer.jsp"%>
