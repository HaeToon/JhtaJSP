package com.heo96.jspmodel2replyboard.dao;



import com.heo96.jspmodel2replyboard.connect.JDBCConnectionPool;
import com.heo96.jspmodel2replyboard.dto.BoardDto;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDao extends JDBCConnectionPool {
    public List<BoardDto> boardContentList(){
        List<BoardDto> boardContentList=new ArrayList<>();
        String sql="select * from board order by no desc";
        try {
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while(rs.next()){
                BoardDto boardDto = new BoardDto();
                boardDto = BoardDto.builder()
                        .no(rs.getInt("no"))
                        .subject(rs.getString("subject"))
                        .userName(rs.getString("username"))
                        .regdate(rs.getString("regdate"))
                        .hit(rs.getInt("hit"))
                        .build();
                boardContentList.add(boardDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }
        return boardContentList;
    }
    public BoardDto boardContentView(int no){
        BoardDto boardContentViewDto=null;
        String sql = "select * from board where no=?";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,no);
            rs=pstmt.executeQuery();
            if(rs.next()){
                boardContentViewDto= BoardDto.builder()
                        .no(rs.getInt("no"))
                        .userID(rs.getString("userid"))
                        .userName(rs.getString("username"))
                        .subject(rs.getString("subject"))
                        .content(rs.getString("content"))
                        .regdate(rs.getString("regdate"))
                        .password(rs.getString("password"))
                        .hit(rs.getInt("hit"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally{
            close();
        }
        return boardContentViewDto;
    }

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

    public List<BoardDto> getContentList() {
        List<BoardDto>boardDtoList = null;
        String sql = "select * from board order by regroup desc,relevel asc";
//        String sql = "select * from board where available = 1 order by regroup desc,relevel asc";
        try {
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            boardDtoList=new ArrayList<>();
            while(rs.next()){
                BoardDto boardDto = BoardDto.builder()
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
        String sql = "select * from board where no=? ";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1,no);
            rs=pstmt.executeQuery();
            if(rs.next()){
                boardDto = BoardDto.builder()
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
}
