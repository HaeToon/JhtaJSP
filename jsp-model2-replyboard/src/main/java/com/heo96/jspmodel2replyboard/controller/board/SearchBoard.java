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

@WebServlet("/board/content-search")
public class SearchBoard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String searchWord = request.getParameter("searchWord");

        if(search==null || searchWord ==null){
            ScriptWritter.alertAndBack(response,"검색에 실패했습니다.");
        }else {
                BoardDao boardDao = new BoardDao();
                List<BoardDto> searchBoardList = boardDao.searchBoard(search, searchWord);
                request.setAttribute("contentList", searchBoardList);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-list.jsp");
                dispatcher.forward(request, response);
            }

    }
}
