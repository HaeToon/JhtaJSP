<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.heo96.jsp05.connect.JDBCConnect" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %>
<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.ResultSet" %><%--
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
    String userEmail=request.getParameter("userEmail");
    String postCode=request.getParameter("postCode");
    String adress = request.getParameter("adress");
    String detailAdress=request.getParameter("detailAdress");
    System.out.println(detailAdress);



//    JDBCConnect jdbcConnect = new JDBCConnect(); //연결을 클래스로 잡아서 간단하게 작성 >> 외부에 노출되는부분이 있음. 1번방법

//    String driver = application.getInitParameter("OracleDriver");  //2번방법
//    String url = application.getInitParameter("OracleUrl");
//    String id = application.getInitParameter("OracleId");
//    String password = application.getInitParameter("OraclePassword");
//    JDBCConnect jdbcConnect = new JDBCConnect(driver,url,id,password);

//    JDBCConnect jdbcConnect = new JDBCConnect(application); //3 번방법

    //Pool 을 만들어서 사용 4번방법
    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    //web.xml 을 바꾼거기때문에 서버를 껏다켜야함.

    //sqlinjection 주입
    
        String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
        pstmt.setString(1,userID); // ?의 값 정해주는것 번호는 ?기준으로만 잡음.
        pstmt.setString(2,userPW);
        pstmt.setString(3,userName);
        pstmt.setString(4,userBirth);
        pstmt.setString(5,userEmail);
        pstmt.setString(6,postCode);
        pstmt.setString(7,adress);
        pstmt.setString(8,detailAdress);
        int result = pstmt.executeUpdate(); //0또는 1리턴
        System.out.println(result);
        if(result>0){
            //일반 경고창 띄우는 경우 1 , 경고창 띄우고 페이지 바뀌는경우 2, 경고창 띄우고 뒤로가기 3
            ScriptWritter.alertAndNext(response,"회원가입 되었습니다.","../index/index.jsp");
        }else {
            ScriptWritter.alertAndBack(response,"회원가입에 실패했습니다 다시 해주시기 바랍니다.");
        }


//    jdbcConnectionPool.close();
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

</body>
</html>
