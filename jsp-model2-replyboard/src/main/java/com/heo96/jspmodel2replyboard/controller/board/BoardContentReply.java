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

@WebServlet("/board/reply")
public class BoardContentReply extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/board/reply.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        BoardDto boardDto01 = BoardDto.builder()
                .regroup(Integer.parseInt(request.getParameter("regroup")))
                .relevel(Integer.parseInt(request.getParameter("relevel")))
                .build();
        BoardDao updateRelevelDao = new BoardDao();
        int result = updateRelevelDao.updateRelevel(boardDto01); // 나 이외의 것들 업데이트

        BoardDto boardDto02 = BoardDto.builder()
                .userID(request.getParameter("userID"))
                .userName(request.getParameter("userName"))
                .subject(request.getParameter("subject"))
                .password(request.getParameter("password"))
                .content(request.getParameter("content"))
                .regroup(Integer.parseInt(request.getParameter("regroup")))
                .relevel(Integer.parseInt(request.getParameter("relevel"))+1)
                .restep(Integer.parseInt(request.getParameter("restep"))+1)
                .build();

        BoardDao replyBoardDao = new BoardDao();
        int result02 = replyBoardDao.replyBoard(boardDto02);

        if(result02>0){
            ScriptWritter.alertAndNext(response,"댓글이 작성되었습니다.","/board/content-list");
        }else {
            ScriptWritter.alertAndBack(response,"댓글 작성에 실패했습니다.");
        }
    }
}
