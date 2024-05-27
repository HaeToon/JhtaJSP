
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp"%>
<main class="form-signin w-100 m-auto">
    <form action="/member/login-member" method="post">
        <h1 class="h3 mb-3 fw-normal">로그인</h1>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" placeholder="userID" name="userID" value="${cookie.savedID.value}">
            <label for="floatingInput">User ID</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="userPW">
            <label for="floatingPassword">Password</label>
        </div>

        <div class="form-check text-start my-3">
            <input class="form-check-input" type="checkbox" value="yes" id="flexCheckDefault" name="saveID" <c:if test="${not empty cookie.savedID}">checked</c:if>>
            <label class="form-check-label" for="flexCheckDefault">
                아이디 저장하기
            </label>
        </div>
        <button class="btn btn-primary w-100 py-2" type="submit" >로그인</button>
        <button class="btn btn-primary w-100 py-2 mt-2" type="button" >아이디 찾기</button>
        <a href="../mail/password-find" class="btn btn-primary w-100 py-2 mt-2" >비밀번호 찾기</a>
    </form>
</main>
<%@include file="../include/footer.jsp"%>
