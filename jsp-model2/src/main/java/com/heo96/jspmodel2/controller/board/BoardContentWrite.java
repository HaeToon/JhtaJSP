package com.heo96.jspmodel2.controller.board;

import com.heo96.jspmodel2.dao.BoardDao;
import com.heo96.jspmodel2.dto.BoardDto;
import com.heo96.jspmodel2.utils.ScriptWritter;
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-write-model2.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userID = request.getParameter("userID");
        String userName = request.getParameter("userName");
        String subject = request.getParameter("subject");
        String password = request.getParameter("password");
        String content = request.getParameter("content");

        BoardDto boardContentWriteDto = BoardDto.builder()
                .userID(userID)
                .userName(userName)
                .password(password)
                .subject(subject)
                .content(content)
                .build();
        BoardDao boardContentWriteDao = new BoardDao();
        int result = boardContentWriteDao.boardContentWrite(boardContentWriteDto);
        if(result>0){
            ScriptWritter.alertAndNext(response,"글이 작성되었습니다.","../board/content-list");
        }else {
            ScriptWritter.alertAndBack(response,"알수없는 이유로 글이 작성되지 않았습니다.");
        }

    }
}
