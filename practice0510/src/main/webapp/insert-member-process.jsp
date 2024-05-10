<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오후 4:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String userId = request.getParameter("userID");
    String userPw = request.getParameter("userPW");
    String userName = request.getParameter("userName");
    String userBirth = request.getParameter("userBirth");

    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","heoth","1234");

    String sql="insert into member values(member_seq.nextval,?,?,?,?)";
    PreparedStatement pstmt = conn.prepareStatement(sql);

    pstmt.setString(1,userId);
    pstmt.setString(2,userPw);
    pstmt.setString(3,userName);
    pstmt.setString(4,userBirth);

   int result = pstmt.executeUpdate();
   if(result>0){
        out.println("<script>alert(\"회원가입 성공.\")</script>");
   }else {
    out.println("<script>alert(\"회원가입 실패\"</script>");
   }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form action="index.jsp">
        <button>홈으로</button>
    </form>
</body>
</html>
