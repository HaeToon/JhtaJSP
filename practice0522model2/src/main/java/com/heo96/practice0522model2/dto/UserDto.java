package com.heo96.practice0522model2.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class UserDto {
    private int no;
    private String userID;
    private String userPW;
    private String userName;
    private String userBirth;
    private String userEmail;
    private String userPostCode;
    private String userAdress;
    private String userDetailAdress;
    private String regdate;
    private String Grade;
}
