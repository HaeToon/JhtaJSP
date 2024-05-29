package com.heo96.mybatis.dao;

import com.heo96.mybatis.dto.BoardDto;
import com.heo96.mybatis.mybatis.MybartisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

public class BoardDao {
    public BoardDto getBoard(){
        BoardDto boardDto = null;
        SqlSession sqlSession = MybartisConnectionFactory.getSqlSession(); // db접근하는것
        boardDto = sqlSession.selectOne("getBoard",350);//parameter는 하나만던져짐.

        sqlSession.close();
        return boardDto;
    }
}
