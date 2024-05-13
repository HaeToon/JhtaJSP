package com.heo96.jsp05.connect;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCConnectionPool {
    public Connection conn;
    public PreparedStatement pstmt;
    public ResultSet rs;

    public JDBCConnectionPool() {
        try {
            Context initContext = new InitialContext();
            Context context = (Context)initContext.lookup("java:comp/env");
            DataSource dataSource = (DataSource)context.lookup("dbcp_oracle");
            conn=dataSource.getConnection();
            System.out.println("dbConnectionPool Connected");
        } catch (NamingException e) {
            System.out.println("naming error");
            throw new RuntimeException(e);
        } catch (SQLException e) {
            System.out.println("sql error");
            throw new RuntimeException(e);
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
