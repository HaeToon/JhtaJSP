package com.heo96.jsp03.util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
    //CookieManager.createCookie = static달기
    public static void createCookie(HttpServletResponse response, String cookieName, String cookieValue, int second){
        Cookie cookie = new Cookie(cookieName,cookieValue);
        cookie.setMaxAge(second);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
    //readCookie , deleteCookie
    //cookie 읽는 method 만들어보기
    //쿠키 지우기 같은 이름의 쿠키를 새로만들면서 시간을 0으로 하면된다.
    public static String readCookie(HttpServletRequest request , String cookieName){
        Cookie cookies[] = request.getCookies();
        String cookieValue = "";
        if(cookies!=null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals(cookieName)) {
                    cookieValue = cookie.getValue();
                }
            }
        }
        return cookieValue;
    }

    public static void deleteCookie(HttpServletResponse response , String cookieName){
        createCookie(response,cookieName,null,0) ;

    }
}
