<%@ page import="com.heo96.jsp05.connect.JDBCConnect" %>
<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.heo96.jsp05.utils.ScriptWritter" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-16
  Time: 오전 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    JDBCConnectionPool jdbcConnectionPool = new JDBCConnectionPool();
    try { //commit이 되었을때
    String sql = "delete from member where no = ?";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);
    jdbcConnectionPool.conn.setAutoCommit(false); //auto commit 끄기

    String noList[] = request.getParameterValues("check"); //여러개의 값을 받을때 getParamenterValues(변수명) 배열을 리턴함.
    //한번에 다지울때는 트랜잭션을 구현해둬야함.
    //

        for (int i = 0; i < noList.length; i++) {
            System.out.println(noList[i]);
            pstmt.setInt(1, Integer.parseInt(noList[i]));
            pstmt.addBatch();//한번에 처리하기위한 함수
            if(i==1){
//                throw new Exception("알 수 없는 서버 오류");
            }
        }
        int result[] = pstmt.executeBatch(); //처리되는 개수
        System.out.println(Arrays.toString(result));
        jdbcConnectionPool.conn.commit(); //조건을 만족했을때 커밋하기
//    jdbcConnectionPool.conn.setAutoCommit(true); //하나하나 커밋할때 사용
        ScriptWritter.alertAndBack(response, "삭제되었습니다.");
    } catch (Exception e) { //commit이 안되었을때
        jdbcConnectionPool.conn.rollback();
        e.printStackTrace();
        jdbcConnectionPool.conn.close();
    } finally { //무조건 실행되는것 롤백을하던 커밋을하던 다음번에 들어오는것을 auto commit함.
        try{
            jdbcConnectionPool.conn.setAutoCommit(true);
            jdbcConnectionPool.conn.close();
        }catch(Exception e){
            e.printStackTrace();
        }

    }
%>
