package com.heo96.jsp05.connect;

import jakarta.servlet.ServletContext;

import java.sql.*;

// db 연결을 클래스로 구현해서 생성자로 편하게 쓰기
public class JDBCConnect {
   public Connection conn; //private 시 getter setter 필요
   public PreparedStatement pstmt; //query 를 날리기위한 객체
   public ResultSet rs; // select 에서 값 받아오기


    public JDBCConnect() { //1
        {
            try {
                Class.forName("oracle.jdbc.OracleDriver");
                String url = "jdbc:oracle:thin:@localhost:1521:xe";
                String id = "heoth";
                String password = "1234";
                conn = DriverManager.getConnection(url,id,password);
                System.out.println("db connect");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public JDBCConnect(String driver , String url , String id ,String password) { //2
        {
            try {
                Class.forName(driver);
                conn = DriverManager.getConnection(url,id,password);
                System.out.println("db connect");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public JDBCConnect(ServletContext application) { //3  2번과 3번은 같다
        {
            try {
                String driver = application.getInitParameter("OracleDriver");
                String url = application.getInitParameter("OracleURL");
                String id = application.getInitParameter("OracleId");
                String password = application.getInitParameter("OraclePassword");
                System.out.println(driver);
                System.out.println(url);
                System.out.println(id);
                System.out.println(password);
                Class.forName(driver);
                conn = DriverManager.getConnection(url,id,password);
                System.out.println("db connect");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public void close(){
        //pool 연결할수있는것을 모아두기
        try {
            if(rs!=null) {
                rs.close();
                System.out.println("Rs close");
            }
            if(pstmt!=null) {
                pstmt.close();
                System.out.println(("pstmt close"));
            }
            if(conn!=null) {
                conn.close();
                System.out.println("conn close");
            }
            System.out.println("jdbc disconnect");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

}
