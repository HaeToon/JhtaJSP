package com.heo96.jspmodel2.dao;

import com.heo96.jspmodel2.connect.JDBCConnectionPool;
import com.heo96.jspmodel2.dto.MemberDto;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

//Data Access Object
//pool
public class MemberDao extends JDBCConnectionPool {
    //1.db연결 ,
    // 2.sql 생성 ,
    // 3.preparedstatement에 값 설정,
    // 4.select = executeQuery() =ResultSet 나머지=executeUpdate() = int
    //dao (database access object) connect 묶기
    //dto(database transfer object) db받는부분 묶기
    public int insertMember(MemberDto memberDto) throws SQLException {
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
            close();
        }
        return result;
    }

    public int checkDuplicateId(String userID) {
        int result = 0;
        String sql = "select count(*) as count from member where userid=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                result = rs.getInt("count");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return result;
    }

    public MemberDto loginMember(String userID, String userPW) {
        MemberDto loginMemberDto = null;
        String sql = "select * from member where userid=? and userpw=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            pstmt.setString(2, userPW);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                loginMemberDto = new MemberDto();
                loginMemberDto.setUserID(rs.getString("userid"));
                loginMemberDto.setUserName(rs.getString("username"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
           close();
        }
        return loginMemberDto;
    }

    public MemberDto infoMember(String userID) {
        MemberDto infoMemberDto = null;
        String sql = "select * from member where userid = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                infoMemberDto = MemberDto.builder()
                        .no(rs.getInt("no"))
                        .userID(rs.getString("userid"))
                        .userPW(rs.getString("userpw"))
                        .userName(rs.getString("username"))
                        .userBirth(rs.getString("userbirth"))
                        .email(rs.getString("email"))
                        .postcode(rs.getString("postcode"))
                        .adress(rs.getString("adress"))
                        .detailAdress(rs.getString("detailadress"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
           close();

        }
        return infoMemberDto;
    }

    public List<MemberDto> listMember() {
        List<MemberDto> memberDtoList = null;
        String sql = "select * from member";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            memberDtoList = new ArrayList<>();
            while (rs.next()) {
                MemberDto memberDto = MemberDto.builder()
                        .no(rs.getInt("no"))
                        .userID(rs.getString("userid"))
                        .userPW(rs.getString("userpw"))
                        .userName(rs.getString("username"))
                        .userBirth(rs.getString("userbirth"))
                        .email(rs.getString("email"))
                        .postcode(rs.getString("postcode"))
                        .adress(rs.getString("adress"))
                        .detailAdress(rs.getString("detailadress"))
                        .build();
                memberDtoList.add(memberDto);

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            close();
        }
        return memberDtoList;
    }
    public int deleteMember(String userID){
        int result=0;
        String sql="delete from member where userid=?";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,userID);
           result = pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }
        return result;
    }

}
