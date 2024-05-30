package com.heo96.mybatis.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class SearchDto {
    private String search;
    private String searchWord;
}
