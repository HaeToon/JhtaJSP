package com.heo96.mybatis.controller.member;

import com.google.gson.Gson;
import com.heo96.mybatis.dao.MemberDao;
import com.heo96.mybatis.dto.MemberDto;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/member/member-id-check")
public class MemberIDCheck extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MemberDao memberIDCheckDao = new MemberDao();
        int result = memberIDCheckDao.memberIDCheck(request.getParameter("userID"));

        Map<String, Integer> resultMap = new HashMap<>();
        resultMap.put("count", result);
        Gson gson = new Gson();
        String resultJson = gson.toJson(resultMap);
        response.setContentType("application/json; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.println(resultJson);

    }
}
