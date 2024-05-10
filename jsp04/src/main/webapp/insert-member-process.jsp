<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-10
  Time: 오전 10:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String userID=request.getParameter("userID");
    String userPW=request.getParameter("userPW");
    String userName=request.getParameter("userName");
    String userBirth=request.getParameter("userBirth"); //String 던져도 묵시적 형변환으로 인해 알아서 들어감.
    System.out.println(userBirth);

    Class.forName("oracle.jdbc.OracleDriver"); //oracle 드라이버 로딩하는것.
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","heoth","1234"); //connection 리턴 DB 연결하는것.

    //sqlinjection 주입
    String sql = "insert into member values(member_seq.nextval,?,?,?,?)";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1,userID); // ?의 값 정해주는것 번호는 ?기준으로만 잡음.
    pstmt.setString(2,userPW);
    pstmt.setString(3,userName);
    pstmt.setString(4,userBirth);
    int result = pstmt.executeUpdate(); //0또는 1리턴
    if(result>0){
        out.println("<script>alert(\"회원가입 되었습니다.\")</script>");
//        out.println("""
//                    <script>alert("회원가입 되었습니다.")</script>
//                """);
    }else {
        out.println("<script><alert(\"회원가입 안되었습니다.\"</script>");
    }

%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
