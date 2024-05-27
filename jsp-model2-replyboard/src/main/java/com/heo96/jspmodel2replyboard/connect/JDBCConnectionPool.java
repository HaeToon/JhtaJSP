package com.heo96.jspmodel2replyboard.connect;

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
            Context context = (Context) initContext.lookup("java:comp/env");
            DataSource dataSource = (DataSource) context.lookup("dbcp_oracle");
            conn = dataSource.getConnection();
            System.out.println("DB Connection Connected");
        } catch (NamingException e) {
            System.out.println("naming error");
            throw new RuntimeException(e);
        } catch (SQLException e) {
            System.out.println("sql error");
            throw new RuntimeException(e);
        }
    }

   public void close() {
        try {
            if (rs != null) {
                System.out.println("rs disconnect");
                rs.close();
            }
            if (pstmt != null) {
                System.out.println("pstmt disconnect");
                pstmt.close();
            }
            if (conn != null) {
                System.out.println("conn disconnect");
                conn.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}






