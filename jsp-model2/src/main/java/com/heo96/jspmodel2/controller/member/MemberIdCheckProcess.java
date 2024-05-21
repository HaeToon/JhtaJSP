package com.heo96.jspmodel2.controller.member;

import com.google.gson.Gson;
import com.heo96.jspmodel2.dao.MemberDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/member/id-check-process")
public class MemberIdCheckProcess extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        super.doPost(req, resp);
        String userID=request.getParameter("userID");
        MemberDao memberDao = new MemberDao();
        int result = memberDao.checkDuplicateId(userID); //0 or 1
        Gson gson = new Gson();
        Map<String,Integer> countMap = new HashMap<>();
        countMap.put("count",result);
        String json = gson.toJson(countMap);
//        PrintWriter out=response.getWriter();
//        response.setContentType("application/json; charset=utf-8;");
//        out.println(json);
        request.setAttribute("json",json);
        RequestDispatcher dispatcher =request.getRequestDispatcher("/WEB-INF/member/id-check-model2.jsp");
        dispatcher.forward(request,response);
    }
}
