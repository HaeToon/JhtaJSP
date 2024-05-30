<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-30
  Time: 오전 11:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
    <div class="container">
        <form action="/board/delete" method="post">
            <input type="hidden" value="${param.no}" name="no">
            <span>삭제할 글 번호 : ${param.no}</span>
            <span>비밀번호를 입력해 주세요</span>
            <input type="text" name="password">
            <button class="btn btn-outline-danger">삭제하기</button>
        </form>
    </div>
<%@include file="../include/footer.jsp"%>
