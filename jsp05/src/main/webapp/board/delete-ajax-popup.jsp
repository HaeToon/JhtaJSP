<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-17
  Time: 오전 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    String password=request.getParameter("userPW");
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "delete from board where no = ? and password=?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1,no);
    jdbcConnectionPool.pstmt.setString(2,password);
    int result = jdbcConnectionPool.pstmt.executeUpdate();
    response.setContentType("application/json;,charset=utf-8"); //default = text/html mime type=application/json
    String msg = null;

    if(result>0){
        msg="yes";
    }else {
        msg="no";
    }
    //rest api 할때 많이씀.
    Map<String,String> resultMap = new HashMap<>();
    resultMap.put("isDelete",msg); // front 랑 변수명,값 체크 해야함
    Gson gson = new Gson();
    String resultJson = gson.toJson(resultMap);
    out.println(resultJson);// {"isDelete"}:"yes"} json 응답
    jdbcConnectionPool.close();
%>