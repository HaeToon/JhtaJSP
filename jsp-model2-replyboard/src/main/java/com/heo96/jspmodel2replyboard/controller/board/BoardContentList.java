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
        String search = request.getParameter("search");
        String searchWord = request.getParameter("searchWord");

        BoardDao totalBoardDao = new BoardDao();
        BoardDao boardDao = new BoardDao();
        int start = 0;
        if (request.getParameter("page")==null) {
            start=1;
        }else {
            start=Integer.parseInt(request.getParameter("page"));
        }
        int total=0;
        if(search==null){
            total = totalBoardDao.getTotal(); //검색아닐때
        }else {
            total = totalBoardDao.getTotal(search,searchWord); //검색일때
        }

        int listPerPage = 10; // 한번에 보여질 게시물 수
        int paginationPerPage= 3; //페이지네이션의 수
        int totalPage = (int)Math.ceil((double)total/listPerPage);
        int totalPagination = (int)Math.ceil((double)totalPage/paginationPerPage);

        int paginationStart =((start-1)/paginationPerPage)*paginationPerPage+1;
        int paginationEnd = paginationStart+paginationPerPage-1;
        if(paginationEnd>totalPage){
            paginationEnd=totalPage;
        }
        List<BoardDto> boardDtoList=null;
        if(search==null){
            boardDtoList = boardDao.getPageList(((start-1)*listPerPage)+1,(start)*listPerPage);
        }else {
            boardDtoList = boardDao.searchBoard(search, searchWord,((start-1)*listPerPage)+1,(start)*listPerPage);
        }
        if(boardDtoList!=null) {
            request.setAttribute("contentList", boardDtoList);
            request.setAttribute("totalPage", totalPage);

            request.setAttribute("paginationStart",paginationStart);
            request.setAttribute("paginationEnd",paginationEnd);
            request.setAttribute("paginationPerPage",paginationPerPage);
            request.setAttribute("totalPagination",totalPagination);
            if(search!=null){
                request.setAttribute("search",search);
                request.setAttribute("searchWord",searchWord);
            }

            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-list.jsp");
            dispatcher.forward(request,response);
        }else {
            ScriptWritter.alertAndBack(response,"오류발생");
        }
    }
}
