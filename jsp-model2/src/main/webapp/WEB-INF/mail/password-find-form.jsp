<%--
 servlet만들어서 비밀번호 랜덤하게만들어서 보내주고
 db에다가 기존비밀번호 업데이트하기
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<div class="container">
    <h2 class="mt-5 mb-5">비밀번호 찾기</h2>
    <form action="../mail/get-password" method="post">
        <div class="mb-3">
            <label for="userID" class="form-label">User ID</label>
            <input type="text" class="form-control" id="userID" placeholder="비밀번호를 찾을 아이디 입력" name="userID">
        </div>
        <div class="mb-3">
            <label for="userEmail" class="form-label">Email</label>
            <input type="email" class="form-control" id="userEmail" placeholder="새로운 비밀번호를 받을 이메일 주소"
                   name="userEmail">
        </div>
        <button class="btn btn-primary">비밀번호 재설정</button>
    </form>

</div>
<%@include file="../include/footer.jsp"%>
