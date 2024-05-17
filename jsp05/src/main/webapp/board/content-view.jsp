<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String updatesql = "update board set hit= hit+1 where no = ?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(updatesql);
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
        <label class="form-label">제목 : <%=subject%></label>
        <textarea class="form-control textarea" disabled="true" style="resize:none" ><%=content%></textarea>
    </div>
    <div class="mb-3">
        <label class="form-label">작성자 : <%=userName%></label>
        <label class="form-label ">작성일 : <%=regDate%></label>
    </div>
    <div class=" mb-5">
        <a href="../board/list.jsp" class="btn btn-outline-primary">목록으로</a>
        <button class="btn btn-primary" id="btn-modify-content">수정하기</button>
        <button class="btn btn-outline-danger" id="btn-delete">삭제하기</button>
    </div>
</div>
<%--수정하기 버튼에 대한 폼과 스크립트 --%>
<form action="modify-content.jsp" id="modify-content-form">
    <input type="hidden" name="contentNo" value="<%=no%>">
    <input type="hidden" name="writerName" value="<%=userName%>">
    <input type="hidden" name="contentSubject" value="<%=subject%>">
    <input type="hidden" name="content" value="<%=content%>">
</form>
<script>
    $("#btn-modify-content").on("click",function (){
        $("#modify-content-form").submit();
    })
</script>
<%--수정하기 버튼에 대한 폼과 스크립트 --%>
<%--삭제하기 버튼에 대한 폼과 스크립트 --%>
<form action="delete-content-process.jsp" id="content-delete-form">
    <input type="hidden" name="no" value="<%=no%>">
</form>
<script>
    $("#btn-delete").on("click",function (){
        $("#content-delete-form").submit();
    })
</script>
<%--삭제하기 버튼에 대한 폼과 스크립트 --%>
<%--textarea 크기 부분에 대한 스크립트--%>
<script>
    var textArea = $(".textarea");
    if (textArea) {
        textArea.each(function(){
            $(this).height(this.scrollHeight);
        });
    }
</script>
<%@include file="../include/footer.jsp" %>
