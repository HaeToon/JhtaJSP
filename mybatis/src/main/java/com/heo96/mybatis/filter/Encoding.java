package com.heo96.mybatis.filter;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;

import java.io.IOException;

@WebFilter("/*") // 모든 페이지에 다 적용시 /*
public class Encoding implements Filter {

private String encoding = "UTF-8";
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("encoding init");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        System.out.println("filtering ~~~~");
        if(request.getCharacterEncoding()==null){
            request.setCharacterEncoding(encoding);
            System.out.println("UTF-8 encoding");
        }
        chain.doFilter(request,response);
    }

    @Override
    public void destroy() {
        System.out.println("encoding  ");
    }
}
