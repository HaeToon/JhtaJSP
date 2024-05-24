package com.heo96.jspmodel2.controller.board;

import com.heo96.jspmodel2.dao.BoardDao;
import com.heo96.jspmodel2.dao.MemberDao;
import com.heo96.jspmodel2.dto.BoardDto;
import com.heo96.jspmodel2.utils.ScriptWritter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/board/content-view")
public class BoardContentView extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no = Integer.parseInt(request.getParameter("no"));
        BoardDao viewBoardDao = new BoardDao();
        BoardDto boardContentViewDto = viewBoardDao.boardContentView(no);
        if(boardContentViewDto!=null) {
            request.setAttribute("boardContentViewDto", boardContentViewDto);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-view-model2.jsp");
            dispatcher.forward(request, response);
        }else {
            ScriptWritter.alertAndBack(response,"알수없는 오류로 되돌아갑니다.");
        }
    }
}
