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
}
