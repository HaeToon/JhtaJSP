package com.heo96.mybatis.dao;

import com.heo96.mybatis.dto.MemberDto;
import com.heo96.mybatis.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

public class MemberDao {
    public int signUpMember(MemberDto signUpMemberDto){
        int result =0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.insert("memberSignUp",signUpMemberDto);
        sqlSession.close();
        return result;
    }
    public int memberIDCheck(String userID){
        int result=0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result=sqlSession.selectOne("memberIDCheck",userID);
        sqlSession.close();
        return result;
    }
    public MemberDto signInMember(String userID){
        MemberDto memberDto = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        memberDto=sqlSession.selectOne("memberSighIn",userID);
        sqlSession.close();
        return memberDto;
    }
    public MemberDto infoMember(String userID){
        MemberDto memberDto = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        memberDto = sqlSession.selectOne("memberInfo",userID);
        sqlSession.close();
        return memberDto;
    }
    public int memberInfoEdit(MemberDto memberDto){
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.update("memberInfoEdit",memberDto);
        sqlSession.close();
        return result;
    }
}
