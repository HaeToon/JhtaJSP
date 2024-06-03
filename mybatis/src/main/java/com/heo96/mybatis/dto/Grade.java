package com.heo96.mybatis.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
//@RequiredArgsConstructor 필요한것만 가지고 생성사 만드는것
public enum Grade {
    //열거형 데이터 제한하려고 쓰는것.
    //열거형은 getter만 있음 , 속성을 가지는 생성자
    //숫자로 가져올수도있고 문자로 가져올수도있음.
    //문자로 정의 하려면 세팅을 해야함. getter랑 생성자 만들어야함.
    MEMBER("member"),
    MANAGER("manager"),
    ADMIN("admin"); //1,2,3
    private final String lable;
//    public String lable(){ //getter
//        return lable;
//    }
//    Grade(String lable){ //생성자
//        this.lable=lable;
//    }
}
