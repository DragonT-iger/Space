package com.project.space.user.naverlogintest.bo;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.project.space.user.naverlogintest.model.NaverLoginAPI;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NaverLoginBOImpl implements NaverLoginBO{
	private final static String CLIENT_ID = "7ionCSwLhg04IxATNWZ8";
	private final static String CLIENT_SECRET = "OWKvWrJXGL";
	private final static String REDIRECT_URI = "http://localhost:9090/space/NaverCallback";
	private final static String SESSION_STATE = "oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	// 네아로 인증  URL 생성
	@Override
	public String getAuthorizationUrl(HttpSession session) {
		/* 세션 유효성 검증을 위하여 난수를 생성 */
		String state = generateRandomString();
		log.info("UUID 생성값 ==="+state);
		/* 생성한 난수 값을 session에 저장 */
		setSession(session,state);
		// Scribe 라이브러리에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state) //앞서 생성한 난수값을 인증 URL생성시 사용함
				.build(NaverLoginAPI.instance());

		return oauthService.getAuthorizationUrl();
	}

	@Override
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state){
		// Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인
		// getAuthorizationUrl()메서드 실행이 session에 uuid값 저장함
		
		/*테스트 로그 START*/
		System.out.println("NaverLoginBOImple getAccessToken code==>"+code);
		session.setAttribute("oauth_code", code);
		System.out.println("NaverLoginBOImple getAccessToken state==>"+state);
		/*테스트 END*/
		String sessionState = getSession(session);
		if(sessionState.equals(state)){
		
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginAPI.instance());
					
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			OAuth2AccessToken accessToken;
			try {
				accessToken = oauthService.getAccessToken(code);
				log.info("token값=="+accessToken);
				return accessToken;
			} catch (NullPointerException e) {
				return null;
			} catch (IOException ie) {
				ie.getStackTrace();
				return null;
			}
			
		}
		return null;
	}
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

		OAuth20Service oauthService =new ServiceBuilder()
    			.apiKey(CLIENT_ID)
    			.apiSecret(CLIENT_SECRET)
    			.callback(REDIRECT_URI).build(NaverLoginAPI.instance());
    	
    	OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
	public String NaverDeleteToken(String access_token) {
		
		String NaverDeleteTokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id="+CLIENT_ID
				+"&client_secret="+CLIENT_SECRET+"&access_token="+access_token+"&service_provider=NAVER";
		//https://nid.naver.com/oauth2.0/token?grant_type=delete&client_id=&client_secret=&access_token=&service_provider=NAVER
		return NaverDeleteTokenUrl;
	}
	
	
	@Override
	public String generateRandomString() {
		return UUID.randomUUID().toString(); //범용 고유 식별자(UUID) 생성 이미지앞에 uuid값을넣어서 고유이미지명 생성할때 썻엇음
	}

	@Override
	public void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}

	@Override
	public String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
}
