package com.heo96.practice0522model2.dao;

import com.heo96.practice0522model2.connect.JDBCConnectionPool;
import com.heo96.practice0522model2.dto.UserDto;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class UserDao extends JDBCConnectionPool {
    public int userInsert(UserDto userDto) {
        int result = 0;
        String sql = "insert into member values(member_seq.nextval,?,?,?,?,?,?,?,?,?,sysdate,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userDto.getUserID());
            pstmt.setString(2, userDto.getUserPW());
            pstmt.setString(3, userDto.getUserName());
            pstmt.setString(4, userDto.getUserBirth());
            pstmt.setString(5, userDto.getUserEmail());
            pstmt.setString(6, userDto.getUserPostCode());
            pstmt.setString(7, userDto.getUserAdress());
            pstmt.setString(8, userDto.getUserDetailAdress());
            pstmt.setString(9, "user");
            pstmt.setString(10, "profile");
            pstmt.setString(11, "renameProfile");
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }finally{
            close();
        }
        return result;
    }

    public UserDto userLogin(String userID, String userPW) {
        UserDto userLoginDto = null;
        String sql="select * from member where userid=? and userpw=?";
        try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1,userID);
            pstmt.setString(2,userPW);
            rs=pstmt.executeQuery();
            if(rs.next()){
                userLoginDto= UserDto.builder()
                        .userID(rs.getString("userID"))
                        .userName(rs.getString("userName"))
                        .build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userLoginDto;
    }
    public List<UserDto> userDtoList(){
        List<UserDto>userDtoList=null;
        String sql = "select * from member";
        try {
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while (rs.next()){
                UserDto userDto= UserDto.builder()
                        .no(rs.getInt("no"))
                        .userID(rs.getString("userid"))
                        .userPW(rs.getString("userpw"))
                        .userName(rs.getString("username"))
                        .userEmail(rs.getString("email"))
                        .userBirth(rs.getString("userbirth"))
                        .userPostCode(rs.getString("postcode"))
                        .userAdress(rs.getString("adress"))
                        .userDetailAdress(rs.getString("detailadress"))
                        .regdate(rs.getString("regdate"))
                        .build();
                userDtoList.add(userDto);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userDtoList;
    }
}
