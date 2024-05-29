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
public class BoardContentSearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        String searchWord = request.getParameter("searchWord");

        if(search==null || searchWord ==null){
            ScriptWritter.alertAndBack(response,"검색에 실패했습니다.");
        }else {
            int start = 0;
            if (request.getParameter("page")==null) {
                start=1;
            }else {
                start=Integer.parseInt(request.getParameter("page"));
            }

            BoardDao searchTotalDao = new BoardDao();
            BoardDao boardDao = new BoardDao();

            int total = searchTotalDao.getTotal(search,searchWord);
            int listPerPage = 10; // 한번에 보여질 게시물 수
            int paginationPerPage= 5; //페이지네이션의 수
            int totalPage = (int)Math.ceil((double)total/10);
            int totalPagination = (int)Math.ceil((double)totalPage/paginationPerPage);

            int paginationStart =((start-1)/paginationPerPage)*paginationPerPage+1;
            int paginationEnd = paginationStart+paginationPerPage-1;
            if(paginationEnd>totalPage){
                paginationEnd=totalPage;
            }
            System.out.println(total);
            List<BoardDto> searchBoardList = boardDao.searchBoard(search, searchWord,((start-1)*listPerPage)+1,(start)*listPerPage);
            if(searchBoardList!=null){
                request.setAttribute("paginationStart",paginationStart);
                request.setAttribute("paginationEnd",paginationEnd);
                request.setAttribute("paginationPerPage",paginationPerPage);
                request.setAttribute("totalPagination",totalPagination);
                request.setAttribute("search",search);
                request.setAttribute("searchWord",searchWord);

                request.setAttribute("contentList", searchBoardList);

                RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/content-search-list.jsp");
                dispatcher.forward(request, response);
            }else {
                ScriptWritter.alertAndBack(response,"오류발생");
            }

            }

    }
}
