package com.heo96.jsp05.utils;

import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

public class ScriptWritter {
    public static void alert(HttpServletResponse response,String msg){ //그냥 경고창
        try {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert(\""+msg+"\")</script>");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
    public static void alertAndNext(HttpServletResponse response,String msg,String url){ //경고창 띄우고 url로이동
        try {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert(\""+msg+"\");location.href=\""+url+"\";</script>");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
    public static void alertAndBack(HttpServletResponse response,String msg){ //경고창 띄우고 이전페이지로 이동
        try {
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert(\""+msg+"\");history.back();</script>");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }
}
