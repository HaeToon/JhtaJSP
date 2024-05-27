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

@WebServlet("/board/delete")
public class BoardContentDelete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-delete.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no = Integer.parseInt(request.getParameter("no"));
        String password = request.getParameter("password");
        BoardDto boardDto = BoardDto.builder()
                .no(no)
                .password(password)
                .build();
        BoardDao boardDao = new BoardDao();
        int result = boardDao.contentDelete(boardDto);
        if(result>0){
            ScriptWritter.alertAndNext(response,"삭제되었습니다","/board/content-list");
        }else{
            ScriptWritter.alertAndBack(response,"오류발생");
        }
    }
}
