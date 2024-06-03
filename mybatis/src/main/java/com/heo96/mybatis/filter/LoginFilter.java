package com.heo96.mybatis.filter;

import com.heo96.mybatis.utils.ScriptWritter;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
//spring context 안에서 동작하는 interceptor랑 조금다르지만 하는역할은 비슷하다.
@WebFilter("/board/*")
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //로그인 안한사람 >> 로그인
        HttpServletRequest req = (HttpServletRequest)request;
        HttpSession session = req.getSession();
        if (session.getAttribute("loggedID") != null) {
            chain.doFilter(request,response); //로그인되면
        }else { //로그인되지않으면
            HttpServletResponse resp=(HttpServletResponse)response;
            //비정상적인 경로로의 접근을 방지 하기위해 절대경로로 변경 req.getContextPath()+"/member/member-sign-in"
            ScriptWritter.alertAndNext(resp,"로그인 페이지로 이동",req.getContextPath()+"/member/member-sign-in");
        }
        //로그인 한 사람 >> index
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
