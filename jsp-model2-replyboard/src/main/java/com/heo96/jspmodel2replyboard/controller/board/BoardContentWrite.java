package com.heo96.jspmodel2replyboard.controller.board;

import com.heo96.jspmodel2replyboard.dao.BoardDao;
import com.heo96.jspmodel2replyboard.dto.BoardDto;
import com.heo96.jspmodel2replyboard.utils.ScriptWritter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/content-write")
public class BoardContentWrite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-write.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BoardDao maxBoardDao = new BoardDao();
        int regroup = maxBoardDao.getMaxRegroup();
        BoardDto boardDto = BoardDto.builder()
                .userID(request.getParameter("userID"))
                .userName(request.getParameter("userName"))
                .subject(request.getParameter("subject"))
                .password(request.getParameter("password"))
                .content(request.getParameter("content"))
                .regroup(regroup+1)
                .build();

        BoardDao boardDao = new BoardDao();

        int result = boardDao.writeBoard(boardDto);
        if(result>0){
            ScriptWritter.alertAndNext(response,"글이 작성되었습니다.","/board/content-list");
        }else {
            ScriptWritter.alertAndBack(response,"글 작성에 실패했습니다.");
        }
    }


}
