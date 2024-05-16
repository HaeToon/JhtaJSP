<%@ page import="com.heo96.jsp05.connect.JDBCConnect" %>
<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-16
  Time: 오후 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = (String)session.getAttribute("userID");
    System.out.println(userID);
    String userName = request.getParameter("writeUserName");
    String subject=request.getParameter("writeSubject");
    String content = request.getParameter("writeContent");
    String password=request.getParameter("contentPassword");

    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "insert into board values(board_seq.nextval,?,?,?,?,?,sysdate,0)";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,password);
    pstmt.setString(2,userID);
    pstmt.setString(3,userName);
    pstmt.setString(4,subject);
    pstmt.setString(5,content);

    int result = pstmt.executeUpdate();

    if(result>0){
        ScriptWritter.alertAndNext(response,subject+"글이 작성되었습니다.","list.jsp");
    }else {
        ScriptWritter.alertAndBack(response,"글이 작성되지 않았습니다.");
    }
    pstmt.close();
    jdbcConnectionPool.close();
%>
