<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userID = request.getParameter("userID");
    //만약 userID가 db에 있는지 alert
//    System.out.println("ajax >" + userID);
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    String sql = "select count(*) as count from member where userID = ?";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1, userID);
    ResultSet rs = pstmt.executeQuery();
//    System.out.println(rs.next()); //활성화시 체크하면 안뜸; 에라이
    int result = 0; //중복이라면 1 아니라면 0
    if (rs.next()) {
        result = rs.getInt("count");
    }
    response.setContentType("application/json; charset=utf-8");
    Map<String, Integer> countMap = new HashMap<>();
    countMap.put("count", result);
    Gson gson = new Gson();
    String returnJson = gson.toJson(countMap);
    out.println(returnJson);
//       response.setContentType("text/htlm; charset=utf-8"); //default
//       out.println("{\"count\":\""+result+"\"}"); //json 형태 "{count:"+result+"}"
    rs.close();
    pstmt.close();
    jdbcConnectionPool.close();
%>
