<%@ page import="com.heo96.jsp05.connect.JDBCConnectionPool" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.heo96.jsp05.dto.BoardDto" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: jhta
  Date: 2024-05-16
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../include/header.jsp"%>
<%
    int intPage=1;
    String strNo = request.getParameter("page");
    if(Integer.parseInt(strNo)!=0){
        intPage=Integer.parseInt(request.getParameter("page"));
    }
    int perPage=10;
    int start = (intPage-1)*perPage+1;
    int end = start+perPage;
    JDBCConnectionPool jdbcConnectionPool=new JDBCConnectionPool();
//    String sql = "select * from board order by no desc";
  String sql = "SELECT * FROM (SELECT ROWNUM AS NUM , B.* FROM (SELECT * FROM BOARD ORDER BY NO DESC) B) WHERE NUM BETWEEN ? AND ?";
    PreparedStatement pstmt = jdbcConnectionPool.conn.prepareStatement(sql);

    pstmt.setInt(1,start);
    pstmt.setInt(2,end);
    ResultSet rs = pstmt.executeQuery();
    List<BoardDto> boardDtoList =new ArrayList<>();
    while(rs.next()){ //list에 값 담기
        BoardDto boardDto = new BoardDto();
        boardDto.setNo(rs.getInt("no"));
        boardDto.setPassword(rs.getString("password"));
        boardDto.setUserid(rs.getString("userid"));
        boardDto.setUsername(rs.getString("username"));
        boardDto.setSubject(rs.getString("subject"));
        boardDto.setContent(rs.getString("content"));
        boardDto.setRegdate(rs.getString("regdate"));
        boardDto.setHit(rs.getInt("hit"));
        boardDtoList.add(boardDto);
    }
    request.setAttribute("boardDtoList",boardDtoList); // 담아두어야 리스트 사용가능
%>
<div class="container">
    <h2 class="mt-5 mb-5">LIST</h2>
    <div class="text-end">
        <form action="user-content-list-view.jsp" method="post">
            <input type="text" name="userID">
            <button id="btn-search-content">검색</button>
        </form>
    </div>
    <form action="content-view.jsp" method="get" id="member-list-form">
        <table class="table table-striped">
            <thead>
            <tr>
                <th>No</th>
                <th>Subject</th>
                <th>viewSubject</th>
                <th>Name</th>
                <th>Hit</th>
                <th>Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="boardDto" items="${boardDtoList}" begin="0" end="9" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td><a href="content-view.jsp?no=${boardDto.no}">${boardDto.subject}<a/></td>
                <td><a href="view.jsp?no=${boardDto.no}">${boardDto.subject}view<a/></td>
                <td>${boardDto.username}</td>
                <td>${boardDto.hit}</td>
                <td>${boardDto.regdate}</td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
    <nav aria-label="Page navigation example">
        <ul class="pagination">
            <c:choose>
                <c:when test="${param.page==1}">
            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                </c:when>
                <c:otherwise>
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                </c:otherwise>
            </c:choose>
            <c:forEach var="boardDto" begin="0" end="9" varStatus="loop">
                <c:choose>
                    <c:when test="${param.page==loop.count}" >
                        <li class="page-item active"><span class="page-link" >${loop.count}</span></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="list-lombok-copy.jsp?page=${loop.count}">${loop.count}</a></li>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </nav>
    <%  rs.close();
        pstmt.close();
        jdbcConnectionPool.close();%>
    <div class="mt-5 mb-5"><a href="../board/write.jsp" class="btn btn-primary">글쓰기</a></div>
</div>
<%@include file="../include/footer.jsp"%>

