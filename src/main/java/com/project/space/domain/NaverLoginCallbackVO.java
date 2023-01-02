package com.project.space.domain;

import lombok.Data;

@Data
public class NaverLoginCallbackVO {
    // API 호출 결과 코드
    private String resultcode;

    // 호출 결과 메시지
    private String message;

    // Profile 상세
    private NaverLoginVO response;
}
