<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-17
  Time: 오후 12:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%--%>
<%--    String no = request.getParameter("no");--%>
<%--%>--%>
<%@include file="../include/header.jsp"%>
<div class="container">
    <form action="delete-password-process.jsp" method="post">
        <label for="userPW">PassWord</label>
        <input type="password" id="userPW" class="form-control" name="userPW">
        <input type="hidden" class="form-control" name="no" value="${param.no}">
<%--        <input type="hidden" class="form-control" name="no" value="<%=no%>"> param으로 중간과정 생략--%>
        <button class="btn btn-primary mt-2">delete</button>
    </form>
</div>
<%@include file ="../include/footer.jsp"%>
