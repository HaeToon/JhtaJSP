package com.heo96.jspmodel2.dao;

import com.heo96.jspmodel2.connect.JDBCConnectionPool;
import com.heo96.jspmodel2.dto.MemberDto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//Data Access Object
//pool
public class MemberDao extends JDBCConnectionPool {
    public int insertMember(MemberDto memberDto) {
        int result = 0;
        String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDto.getUserID());
            pstmt.setString(2, memberDto.getUserPW());
            pstmt.setString(3, memberDto.getUserName());
            pstmt.setString(4, memberDto.getUserBirth());
            pstmt.setString(5, memberDto.getEmail());
            pstmt.setString(6, memberDto.getPostcode());
            pstmt.setString(7, memberDto.getAdress());
            pstmt.setString(8, memberDto.getDetailAdress());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return result;
    }

    public ResultSet loginMember(MemberDto memberDto) {
        ResultSet rs;
        String sql = "select * from member where userid=? and userpw=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, memberDto.getUserID());
            pstmt.setString(2, memberDto.getUserPW());
            rs = pstmt.executeQuery();
            return rs;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

}
