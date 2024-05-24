package com.heo96.practice0522model2.connect;

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
            Context initcontext = new InitialContext();
            Context context = (Context) initcontext.lookup("java:comp/env");
            DataSource dataSource = (DataSource) context.lookup("dbcp_oracle");
            conn = dataSource.getConnection();
            System.out.println("DB Connected");
        } catch (NamingException e) {
            System.out.println("Naming Error");
            throw new RuntimeException(e);
        } catch (SQLException e) {
            System.out.println("Sql Error");
            throw new RuntimeException(e);
        }
    }
    public void close() {
        try {
            if(rs!=null){
                System.out.println("rs close");
                rs.close();
            }
            if(pstmt!=null){
                System.out.println("pstmt close");
                pstmt.close();
            }
            if (conn != null) {
                System.out.println("conn close");
                conn.close();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
