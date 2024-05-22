<%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 12:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.invalidate(); //세션값을 지움
    out.println("<script>alert(\"로그아웃 되었습니다.\");location.href=\"../member/login\"</script>");
%>
