package com.project.interceptor;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class PapagoService {
	
	public static void main(String[] args) {
		PapagoService ps=new PapagoService();
		ps.getTransPages("안녕");
		System.out.println("번역===="+ps);
	}

	public String getTransPages(String pages) {
		String clientId="qxppf11rcl"; //아이디값
		String clientSecret="bleJlhvzW6XJKgqAixPxs1WczohvEwo0y20yWB9j"; //시크릿값
		String apiURL="https://naveropenapi.apigw.ntruss.com/web-trans/v1/translate"; //주소
		String content_type="application/x-www-form-urlencoded"; //컨텐트 타입
		String html;  //번역될 주소
		
		try {
			html=URLEncoder.encode(pages,"UTF-8");
			URL url=new URL(apiURL);
			HttpURLConnection con=(HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST"); //요청방식
			con.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId); //id
			con.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret); //secret key
			con.setRequestProperty("Content-Type", content_type); //content-type
			//post request
			String postParams="source=ko&target=en&html="+html;
			con.setDoOutput(true);
			/*
			 * DataOutputStream wr=new DataOutputStream(con.getOutputStream());
			 * wr.writeBytes(postParams); wr.flush(); wr.close();
			 */
			
			OutputStream os=con.getOutputStream();
			BufferedWriter bw=new BufferedWriter(new OutputStreamWriter(os));
			bw.write(postParams);
			bw.flush();
			bw.close();
			os.close();
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println(responseCode+"<<<responseCode");
			
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 오류 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
			return response.toString();
		} catch (Exception e) {
			System.out.println(e);
			return e.getMessage();
		}
	}
	 	

	
}
