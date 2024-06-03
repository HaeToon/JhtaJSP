package com.heo96.mybatis.filter;

import jakarta.servlet.*;

import java.io.IOException;

public class BasicFilter implements Filter {
FilterConfig config;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
       config=filterConfig;
       String filterName = filterConfig.getFilterName();
        System.out.println("encoding filter init 호출 ===" +filterName);
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        //여기가 핵심
        System.out.println("doFilter 호출됨");
        String filterInitParam = config.getInitParameter("FILTER_INIT_PARAM");
        System.out.println("encodingFilter init param === "+filterInitParam);
        chain.doFilter(request,response); // 이게 없으면 필터이후 끊어짐
        System.out.println("jsp 호출 이후 ");
    }

    @Override
    public void destroy() {
        System.out.println("encoding filter destroy 호출됨");
    }
}
