<%@ page import="com.heo96.jsp05.utils.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String isSaved = CookieManager.readCookie(request,"loggedID");
    String isChecked="";
    if(!isSaved.equals("")){
        isChecked="checked";
    }
    System.out.println(isSaved);
%>
<%@include file="../include/header.jsp"%>
<main class="form-signin w-100 m-auto">
    <form action="login-member-process.jsp" method="post">
<%--        <img class="mb-4" src="/docs/5.3/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">--%>
        <h1 class="h3 mb-3 fw-normal">로그인</h1>

        <div class="form-floating">
            <input type="text" class="form-control" id="floatingInput" placeholder="userID" name="userID" value="<%=isSaved%>">
<%--            <input type="text" class="form-control" id="floatingInput" placeholder="userID" name="userID" value=${cookie.loggedID.value}>--%>
            <label for="floatingInput">User ID</label>
        </div>
        <div class="form-floating">
            <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="userPW">
            <label for="floatingPassword">Password</label>
        </div>

        <div class="form-check text-start my-3">
            <input class="form-check-input" type="checkbox" value="yes" id="flexCheckDefault" name="saveID" <%=isChecked%>>
            <label class="form-check-label" for="flexCheckDefault">
                아이디 저장하기
            </label>
        </div>
        <button class="btn btn-primary w-100 py-2" type="submit" >로그인</button>
    </form>
</main>
<%@include file="../include/footer.jsp"%>
