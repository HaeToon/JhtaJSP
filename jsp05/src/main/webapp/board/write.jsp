<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-16
  Time: 오후 2:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<div class="container">
    <h2 class="mt-5 mb-5">글쓰기</h2>
    <form action="write-process.jsp" method="post">
<%--        <div class="mb-3">--%>
<%--            <label for="userID" class="form-label">User ID</label>--%>
<%--            <input type="text" class="form-control" id="userID" placeholder="User ID" name="userID">--%>
<%--        </div>--%>
        <input type="hidden" value="${userID}" name="writeUserId">
            <div class="mb-3">
                <label for="userName" class="form-label">Name</label>
                <input type="text" class="form-control" id="userName" placeholder="User Name" name="writeUserName">
            </div>

            <div class="mb-3">
                <label for="title" class="form-label">제목</label>
                <input type="text" class="form-control" id="title" placeholder="제목을 입력해 주세요" name="writeSubject">
            </div>
            <div class="mb-3">
                <label for="writerContent" class="form-label">Content</label>
                <textarea name="writeContent" id="writerContent" placeholder="내용을 입력해 주세요" rows="8" class="form-control" ></textarea>
            </div>
    <div class="mb-3">
        <label for="contentpassword" class="form-label">비밀번호</label>
        <input type="password" class="form-control" id="contentpassword" placeholder="비밀번호를 입력해 주세요" name="contentPassword">
    </div>
            <div>
                <button class="btn btn-primary" id="btn-sign">Confirm</button>
                <button type="reset" class="btn btn-secondary ">Reset</button>
            </div>
    </form>
</div>
<%@include file="../include/footer.jsp"%>
