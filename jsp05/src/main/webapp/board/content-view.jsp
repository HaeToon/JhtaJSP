<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-16
  Time: 오후 3:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "select * from board where no=? ";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setInt(1, no);
    ResultSet rs = pstmt.executeQuery();

    String userName = "";
    String subject = "";
    String content = "";
    String regDate = "";

    if (rs.next()) {
        userName = rs.getString("userName");
        subject = rs.getString("subject");
        content = rs.getString("content");
        regDate = rs.getString("regdate");
    }
    rs.close();
    pstmt.close();
    jdbcConnectionPool.close();
%>
<%@include file="../include/header.jsp" %>
<div class="container">
    <h2 class="mt-5 mb-5"></h2>
    <div class="mb-3">
        <label class="form-label " ><%=subject%></label>
        <textarea class="form-control textarea" disabled="true" rows="25" cols="160" style="resize:none"><%=content%></textarea>
    </div>
    <div class="mb-3">
        <label class="form-label">작성자 : <%=userName%></label>
        <label class="form-label ">작성일 : <%=regDate%></label>
    </div>
    <div class="mt-5 mb-5"><a href="../board/list.jsp" class="btn btn-outline-primary">목록으로</a></div>
</div>

<%@include file="../include/footer.jsp" %>
