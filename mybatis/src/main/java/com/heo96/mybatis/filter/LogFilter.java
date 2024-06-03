package com.heo96.mybatis.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

@WebFilter("/*")
public class LogFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request; //외부에서 접근하려는것 찍어보기
           System.out.println("req.getRemoteAddr() === "+req.getRemoteAddr());
        chain.doFilter(request,response);
    }
}
