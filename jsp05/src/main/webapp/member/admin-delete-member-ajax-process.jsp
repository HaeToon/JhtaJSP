<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.google.gson.Gson" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-16
  Time: 오전 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    System.out.println(userID);
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "delete from member where userID=?";
    PreparedStatement pstmt =jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,userID);
    int result = pstmt.executeUpdate();
    System.out.println(result);
    response.setContentType("application/json;charset=utf-8"); //json으로 응답을 하겠다
    Map<String,String> resultMap = new HashMap<>();
    if(result>0){
        resultMap.put("isDelete","yes"); //yes no 부분에 boolean 던져도됨.
    }else{
        resultMap.put("isDelete","no");
    }
    Gson gson = new Gson();
    String returnJson = gson.toJson(resultMap);//객체를 json으로 변환해줌
    out.println(returnJson);
    pstmt.close();
    jdbcConnectionPool.close();
%>
