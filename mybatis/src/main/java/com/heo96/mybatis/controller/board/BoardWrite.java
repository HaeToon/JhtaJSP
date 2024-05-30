package com.heo96.mybatis.controller.board;

import com.heo96.mybatis.dao.BoardDao;
import com.heo96.mybatis.dto.BoardDto;
import com.heo96.mybatis.utils.ScriptWritter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/write")
public class BoardWrite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-write.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int result=0;
        int regroup=0;
        BoardDao maxRegroupDao = new BoardDao();
        regroup=maxRegroupDao.getMaxRegroup();
        BoardDao boardDao = new BoardDao();
        BoardDto boardWriteDto = BoardDto.builder()
                .userID(request.getParameter("userID"))
                .userName(request.getParameter("userName"))
                .password(request.getParameter("password"))
                .subject(request.getParameter("subject"))
                .content(request.getParameter("content"))
                .regroup(regroup+1)
                .build();
        result=boardDao.writeBoard(boardWriteDto);
        if(result>0){
            ScriptWritter.alertAndNext(response,"글이 작성되었습니다.","/board/list");
        }else {
            ScriptWritter.alertAndBack(response,"알수없는 오류로 인해 글이 작성되지 않았습니다.");
        }
    }
}
