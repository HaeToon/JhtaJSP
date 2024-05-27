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
import java.util.List;

@WebServlet("/board/content-list")
public class BoardContentList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       BoardDao boardDao = new BoardDao();
        List<BoardDto> boardDtoList = boardDao.getContentList();
        if(boardDtoList!=null) {
            request.setAttribute("contentList", boardDtoList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-list.jsp");
            dispatcher.forward(request,response);
        }else {
            ScriptWritter.alertAndBack(response,"오류발생");
        }
    }
}
