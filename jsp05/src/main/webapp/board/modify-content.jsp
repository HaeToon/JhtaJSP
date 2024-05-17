<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-16
  Time: 오후 2:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int no = Integer.parseInt(request.getParameter("contentNo"));
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql="select* from board where no = ?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1,no);
    jdbcConnectionPool.rs=jdbcConnectionPool.pstmt.executeQuery();
    jdbcConnectionPool.rs.next();
%>
<%@include file="../include/header.jsp"%>
<div class="container">
    <h2 class="mt-5 mb-5">글수정하기</h2>
    <form action="modify-content-process.jsp" method="post" >
        <input type="hidden" name="userID" value="<%=jdbcConnectionPool.rs.getString("userid")%>" name="writeUserId">
        <input type="hidden" name="modifyContentNo" value="<%=jdbcConnectionPool.rs.getString("no")%>">
        <div class="mb-3">
            <label  class="form-label">Name</label>
            <input type="text" class="form-control" value="<%=jdbcConnectionPool.rs.getString("username")%>" disabled >
        </div>
        <div class="mb-3">
            <label for="title" class="form-label">제목</label>
            <input type="text" class="form-control" id="title" placeholder="제목을 입력해 주세요" name="writeSubject" value="<%=jdbcConnectionPool.rs.getString("subject")%>">
        </div>
        <div class="mb-3">
            <label for="writerContent" class="form-label">Content</label>
            <textarea name="writeContent" id="writerContent" placeholder="내용을 입력해 주세요" rows="8" class="form-control" ><%=jdbcConnectionPool.rs.getString("content")%></textarea>
        </div>
        <div class="mb-3">
            <label for="contentpassword" class="form-label">비밀번호</label>
            <input type="password" class="form-control" id="contentpassword" placeholder="비밀번호를 입력해 주세요" name="modifyContentPassword">
        </div>
        <div>
            <button class="btn btn-primary">Confirm</button>
            <button type="reset" class="btn btn-secondary ">Reset</button>
        </div>
    </form>
</div>
<%jdbcConnectionPool.close();%>
<%@include file="../include/footer.jsp"%>
