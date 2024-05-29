package com.heo96.jspmodel2replyboard.dao;



import com.heo96.jspmodel2replyboard.connect.JDBCConnectionPool;
import com.heo96.jspmodel2replyboard.dto.BoardDto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao extends JDBCConnectionPool {
    public int writeBoard(BoardDto boardDto) {
        int result = 0;
        String sql = "insert into board values(board_seq.nextval,?,?,?,?,?,?,?,?,sysdate,0,1)";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,boardDto.getPassword());
            pstmt.setString(2,boardDto.getUserID());
            pstmt.setString(3,boardDto.getUserName());
            pstmt.setString(4,boardDto.getSubject());
            pstmt.setString(5, boardDto.getContent());
            pstmt.setInt(6,boardDto.getRegroup());
            pstmt.setInt(7, 1);
            pstmt.setInt(8, 1);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }
        return result;
    }
    public int getMaxRegroup(){
        int result =0;
        String sql = "select nvl(max(regroup),0) as max from board ";
        try {
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            if(rs.next()){
                result=rs.getInt("max");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }
        return result;
    }

    public List<BoardDto> getPageList(int start , int end) {
        List<BoardDto>boardDtoList = null;
        String sql =
                "SELECT * FROM " +
                "(SELECT ROWNUM AS NUM,B01.* FROM (SELECT * FROM BOARD ORDER BY NO DESC) B01)" +
                " WHERE NUM BETWEEN ? AND ? and available = 1 order by regroup desc,relevel ASC";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,start);
            pstmt.setInt(2,end);
            rs=pstmt.executeQuery();
            boardDtoList=new ArrayList<>();
            while(rs.next()){
                BoardDto boardDto = BoardDto.builder()
                        .num(rs.getInt("num"))
                        .no(rs.getInt("no"))
                        .password(rs.getString("password"))
                        .userID(rs.getString("userid"))
                        .userName(rs.getString("username"))
                        .subject(rs.getString("subject"))
                        .content(rs.getString("content"))
                        .regroup(rs.getInt("regroup"))
                        .relevel(rs.getInt("relevel"))
                        .restep(rs.getInt("restep"))
                        .regdate(rs.getString("regdate"))
                        .hit(rs.getInt("hit"))
                        .available(rs.getInt("available"))
                        .build();
                boardDtoList.add(boardDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }
        return boardDtoList;
    }

    public BoardDto contentView(int no) {
        BoardDto boardDto = null;
        String sql = "SELECT ROWNUM AS NUM,B01.* FROM (SELECT * FROM BOARD WHERE NO = ?)B01";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,no);
            rs=pstmt.executeQuery();
            if(rs.next()){
                boardDto = BoardDto.builder()
                        .num(rs.getInt("num"))
                        .no(rs.getInt("no"))
                        .password(rs.getString("password"))
                        .userID(rs.getString("userid"))
                        .userName(rs.getString("username"))
                        .subject(rs.getString("subject"))
                        .content(rs.getString("content"))
                        .regroup(rs.getInt("regroup"))
                        .relevel(rs.getInt("relevel"))
                        .restep(rs.getInt("restep"))
                        .regdate(rs.getString("regdate"))
                        .hit(rs.getInt("hit"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }
        return boardDto;
    }
    public int updateRelevel(BoardDto boardDto){
        int result=0;
        String sql="update board set relevel = relevel+1 where regroup =? and relevel > ? ";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,boardDto.getRegroup());
            pstmt.setInt(2,boardDto.getRelevel());
            result = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }

        return result;
    }

    public int replyBoard(BoardDto boardDto) {
        int result = 0;

        String sql = "insert into board values(board_seq.nextval,?,?,?,?,?,?,?,?,sysdate,0,1)";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,boardDto.getPassword());
            pstmt.setString(2,boardDto.getUserID());
            pstmt.setString(3,boardDto.getUserName());
            pstmt.setString(4,"[re]"+boardDto.getSubject());
            pstmt.setString(5,boardDto.getContent());
            pstmt.setInt(6,boardDto.getRegroup());
            pstmt.setInt(7, boardDto.getRelevel());
            pstmt.setInt(8, boardDto.getRestep());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }
        return result;
    }

    public int contentDelete(BoardDto boardDto) {
        int result=0;
        String sql="update board set available = 0 where no=? and password=?";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,boardDto.getNo());
            pstmt.setString(2,boardDto.getPassword());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }
        return result;
    }
    public int getTotal(){
        int result =0;
        String sql = "select count(*) as total from board ";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if(rs.next()){
                result=rs.getInt("total");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally{
            close();
        }
        return result;
    }
    public int getTotal(String search , String searchWord){
        int result =0;
        String sql="";
        if(search.equals("subject")){
            sql = "select count(*) as total from board where available = 1 and subject like '%'||?||'%' ";
        }else if(search.equals("content")){
            sql = "select count(*) as total from board where available = 1 and content like '%'||?||'%' ";
        }else if(search.equals("all")){
            sql = "select count(*) as total from board where available = 1 and subject like '%'||?||'%' or content like '%'||?||'%' ";
        }else if(search.equals("username")){
            sql = "select count(*) as total from board where available = 1 and username like '%'||?||'%' ";
        }
        try {
            pstmt = conn.prepareStatement(sql);
            if(search.equals("all")){
                pstmt.setString(1,searchWord);
                pstmt.setString(2,searchWord);
            }else{
            pstmt.setString(1,searchWord);
            }
            rs = pstmt.executeQuery();
            if(rs.next()){
                result=rs.getInt("total");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally{
            close();
        }
        return result;
    }

    public List<BoardDto> searchBoard(String search, String searchWord , int start , int end) {
        List<BoardDto>boardDtoList=new ArrayList<>();
        String sql="";
        try{
            if(search.equals("subject")){
                sql="SELECT * FROM (SELECT rownum AS num , searchBoard.* FROM (select * from board where subject like '%'||?||'%' ORDER BY NO desc) searchBoard)WHERE available=1 and num BETWEEN ? AND ?";
            } else if (search.equals("content")){
                sql="SELECT * FROM (SELECT rownum AS num , searchBoard.* FROM (select * from board where content like '%'||?||'%' ORDER BY NO desc) searchBoard)WHERE available=1 and num BETWEEN ? AND ?";
            }else if (search.equals("all")){
                sql="SELECT * FROM (SELECT rownum AS num , searchBoard.* FROM (select * from board where subject like '%'||?||'%' or content like '%'||?||'%' ORDER BY NO desc) searchBoard)WHERE available=1 and num BETWEEN ? AND ?";
            }else if (search.equals("username")){
                sql="SELECT * FROM (SELECT rownum AS num , searchBoard.* FROM (select * from board where username like '%'||?||'%' ORDER BY NO desc) searchBoard)WHERE available=1 and num BETWEEN ? AND ?";
            }
                pstmt = conn.prepareStatement(sql);
                if(search.equals("all")) {
                    pstmt.setString(1, search);
                    pstmt.setString(2, searchWord);
                    pstmt.setInt(3, start);
                    pstmt.setInt(4, end);
                }else{
                    pstmt.setString(1,searchWord);
                    pstmt.setInt(2,start);
                    pstmt.setInt(3,end);
                }
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    BoardDto boardDto = BoardDto.builder()
                            .num(rs.getInt("num"))
                            .no(rs.getInt("no"))
                            .password(rs.getString("password"))
                            .userID(rs.getString("userid"))
                            .userName(rs.getString("username"))
                            .subject(rs.getString("subject"))
                            .content(rs.getString("content"))
                            .regroup(rs.getInt("regroup"))
                            .relevel(rs.getInt("relevel"))
                            .restep(rs.getInt("restep"))
                            .regdate(rs.getString("regdate"))
                            .hit(rs.getInt("hit"))
                            .available(rs.getInt("available"))
                            .build();
                    boardDtoList.add(boardDto);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }finally{
                close();
            }
        return boardDtoList;
    }
    public BoardDto getSelect(int num){
        BoardDto boardDto = null;
        String sql="SELECT * FROM (SELECT ROWNUM AS NUM,B01.* FROM (SELECT * FROM BOARD where available=1 ORDER BY REGROUP DESC,RELEVEL ASC)B01) WHERE available= 1 and NUM = ? ORDER BY NUM DESC";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,num);
            rs=pstmt.executeQuery();
            if(rs.next()){
                boardDto = BoardDto.builder()
                        .num(rs.getInt("num"))
                        .no(rs.getInt("no"))
                        .password(rs.getString("password"))
                        .userID(rs.getString("userid"))
                        .userName(rs.getString("username"))
                        .subject(rs.getString("subject"))
                        .content(rs.getString("content"))
                        .regroup(rs.getInt("regroup"))
                        .relevel(rs.getInt("relevel"))
                        .restep(rs.getInt("restep"))
                        .regdate(rs.getString("regdate"))
                        .hit(rs.getInt("hit"))
                        .available(rs.getInt("available"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }
        return boardDto;
    }
}
