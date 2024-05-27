<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-27
  Time: 오후 3:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../include/header.jsp"%>
<div class="container">
    <form action="/board/delete" method="post">
        <input type="hidden" name="no" value="${param.no}">
        <div>
            <label>비밀번호를 입력해주세요</label>
            <input type="password" name="password">
        </div>
        <button>삭제하기</button>
    </form>
</div>
<%@include file="../include/footer.jsp"%>
