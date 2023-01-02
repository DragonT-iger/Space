package com.project.space.user.naverlogintest.model;

import com.github.scribejava.core.builder.api.DefaultApi20; //OAuth2.0 프로토콜을 지원하는 Scribe OpenSource OAuth Java Library
public class NaverLoginAPI extends DefaultApi20{
	protected NaverLoginAPI() {
		
	}
	private static class InstanceHolder{
 		private static final NaverLoginAPI INSTANCE = new NaverLoginAPI();
 	}
 	
 	
 	public static NaverLoginAPI instance(){
 		return InstanceHolder.INSTANCE;
 	}
 	
 	@Override
 	public String getAccessTokenEndpoint() { //접근 토큰 발급 요청 주소
 		return "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
 	}					
 
 	@Override
 	protected String getAuthorizationBaseUrl() { //네이버로그인 인증요청 주소
 		return "https://nid.naver.com/oauth2.0/authorize";
 	}	
}
