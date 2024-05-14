<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@include file="../include/header.jsp"%>
    <form action="delete-member-process.jsp">
        <div class="mb-3">
            <label for="UserPassword" class="form-label">Password</label>
            <input type="password" class="form-control" id="UserPassword" placeholder="userPW" name="userPW">
        </div>
<%--    expression language    --%>
        <input type="hidden" name="userID" value="<%=session.getAttribute("userID")%>">
<%--        <input type="hidden" name="userID" value="${sessionScope.userID}">--%> <%--    expression language    --%>
<%--    sessionScope 생략시 낮은순으로 다찾아봄 context > request > session > application    --%>
        <button class="btn btn-outline-danger">회원탈퇴</button>
    </form>
<%@include file="../include/footer.jsp"%>>
