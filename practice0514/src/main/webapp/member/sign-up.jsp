<%@ page import="com.heo96.practice0514.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-14
  Time: 오후 4:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    JDBCConnectionPool jdbcConnectionPool= new JDBCConnectionPool();
    String sql ="insert into member2 values(member2_seq.nextval,?,?,?,?)";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    pstmt.setString(1,"userID");
    pstmt.setString(2,"userPW");
    pstmt.setString(3,"userName");
    pstmt.setString(4,"userBrith");
    int result = pstmt.executeUpdate();
    if(result>0){

    }else {

    }
%>
<html>
<head>
    <title>Sigh Up</title>
</head>
<body>
    <form action="sign-up-process.jsp">
        <div>
            <label>아이디</label>
            <input type="text">
        </div>
        <div>
            <label>비밀번호</label>
            <input type="password">
        </div>
        <div>
            <label>이름</label>
            <input type="text">
        </div>
        <div>
            <label>생일</label>
            <input type="date">
        </div>
            <button>회원가입</button>
    </form>
</body>
</html>
