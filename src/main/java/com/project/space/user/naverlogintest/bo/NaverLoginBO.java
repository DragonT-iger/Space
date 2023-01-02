package com.project.space.user.naverlogintest.bo;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.github.scribejava.core.model.OAuth2AccessToken;

public interface NaverLoginBO {
	String getAuthorizationUrl(HttpSession session);
	OAuth2AccessToken getAccessToken(HttpSession session, String code, String state);
	
	String generateRandomString();// 세션 유효성 검증을 위한 난수 생성기
	
	void setSession(HttpSession session,String state);// http session에 데이터 저장
	
	String getSession(HttpSession session);//http session에서 데이터 가져오기
	
	String NaverDeleteToken(String access_token); //네이버 토큰 삭제(로그아웃,회원탈퇴시 사용)
	
	String getUserProfile(OAuth2AccessToken oauthToken) throws IOException;
}
