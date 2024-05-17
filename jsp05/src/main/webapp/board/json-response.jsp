<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page contentType="application/json;charset=UTF-8" language="java" %>
<%
    int no = Integer.parseInt(request.getParameter("no"));
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "delete from board where no = ?";
    jdbcConnectionPool.pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.pstmt.setInt(1,no);
    int result = jdbcConnectionPool.pstmt.executeUpdate();
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
    out.println(resultJson);
    jdbcConnectionPool.close();
%>
<%--{"isDelete":<%=msg%>}--%>