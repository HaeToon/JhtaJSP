package com.heo96.mybatis.dao;

import com.heo96.mybatis.dto.BoardDto;
import com.heo96.mybatis.dto.PageDto;
import com.heo96.mybatis.dto.SearchDto;
import com.heo96.mybatis.mybatis.MybatisConnectionFactory;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class BoardDao {
    public BoardDto getBoard(int num){
        BoardDto boardDto = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession(); // db접근하는것
        boardDto = sqlSession.selectOne("getBoard",num);//parameter는 하나만던져짐.

        sqlSession.close();
        return boardDto;
    }
    public List<BoardDto> getBoardList(){
        List<BoardDto>boardList=null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardList = sqlSession.selectList("getBoardList");
        sqlSession.close();
        return boardList;
    }
    public List<BoardDto> getBoardList(Map<String,Integer> pageMap){
        List<BoardDto>boardList=null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardList = sqlSession.selectList("getBoardList",pageMap);
        sqlSession.close();
        return boardList;
    }
    public List<BoardDto> getBoardList(PageDto pageDto){
        List<BoardDto>boardList=null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        boardList = sqlSession.selectList("getBoardList",pageDto);
        sqlSession.close();
        return boardList;
    }
    public int getBoardTotal(){
        int boardTotal=0;
        SqlSession sqlSession=MybatisConnectionFactory.getSqlSession();
        boardTotal=sqlSession.selectOne("getBoardTotal");
        sqlSession.close();
        return boardTotal;
    }
    public int deleteBoard(BoardDto boardDto){
        int result=0;
        SqlSession sqlSession=MybatisConnectionFactory.getSqlSession();
        result=sqlSession.delete("deleteBoard",boardDto);
        sqlSession.close();
        return result;
    }
    public List<BoardDto> searchBoard(SearchDto searchDto){
        List<BoardDto>searchBoardList = null;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        searchBoardList = sqlSession.selectList("searchBoard",searchDto);
        sqlSession.close();

        return searchBoardList;
    }
    public int writeBoard(BoardDto boardDto){
        int result =0;
            SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
            result=sqlSession.insert("writeBoard",boardDto);
            sqlSession.close();
        return result;
    }
    public int getMaxRegroup(){
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result=sqlSession.selectOne("getMaxRegroup");
        sqlSession.close();
        return result;
    }
    public int writeBoardReply(BoardDto boardDto){
        int result=0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result = sqlSession.insert("writeBoardReply",boardDto);
        sqlSession.close();
        return result;
    }
    public int updateRelevel (BoardDto boardDto){
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result=sqlSession.update("updateRelevel",boardDto);
        sqlSession.close();
        return result;
    }
    public int deleteAllBoard (int[] noArray){
        int result = 0;
        SqlSession sqlSession = MybatisConnectionFactory.getSqlSession();
        result=sqlSession.update("deleteAllBoard",noArray);
        sqlSession.close();
        return result;
    }
}
