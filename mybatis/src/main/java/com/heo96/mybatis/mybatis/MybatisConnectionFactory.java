package com.heo96.mybatis.mybatis;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class MybatisConnectionFactory {
    //싱글턴 패턴 = 한개 만들어서 돌려막기
    private static SqlSessionFactory sqlSessionFactory;

    static {
        String resource = "config.xml";
        try {
            InputStream inputStream = Resources.getResourceAsStream(resource);
            System.out.println("resource load success");
            sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
            System.out.println("session load success");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
    public static SqlSession getSqlSession(){
        return sqlSessionFactory.openSession(true); // default = false
    }
    public static SqlSession getSqlSession(boolean isCommit){
        return sqlSessionFactory.openSession(isCommit); // default = false
    }
}