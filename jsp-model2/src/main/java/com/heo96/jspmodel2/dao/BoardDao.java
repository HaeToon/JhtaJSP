package com.heo96.jspmodel2.dao;

import com.heo96.jspmodel2.connect.JDBCConnectionPool;
import com.heo96.jspmodel2.dto.BoardDto;
import com.heo96.jspmodel2.dto.MemberDto;

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
    public int boardContentWrite(BoardDto boardDto){
        int result=0;
        String sql = "insert into board values(board_seq.nextval,?,?,?,?,?,sysdate,?)";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,boardDto.getPassword());
            pstmt.setString(2,boardDto.getUserID());
            pstmt.setString(3,boardDto.getUserName());
            pstmt.setString(4,boardDto.getSubject());
            pstmt.setString(5,boardDto.getContent());
            pstmt.setInt(6,0);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally {
            close();
        }
        return result;
    }
}
