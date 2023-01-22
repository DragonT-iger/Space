package com.space.app.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.inject.Inject;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.space.domain.Space_InfoVO;
import com.project.space.spaceinfo.mapper.SpaceInfoMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/resources/config/spring/datasource-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class AitemsTest {
	@Resource(name="dataSource-oracle")
	private DataSource ds;
	
	@Inject
	private SpaceInfoMapper sMapper;
	
	private static String SECRETKEY = "346BCEC9A8E561CB2E7C0D7BD9950D8A1533EFF6";
	private static String ACCESSKEY = "A2C8A8D7D541E02ECAAE";
	
	@Test
	public void testAitems() throws Exception{
		String baseurl="https://aitems.apigw.ntruss.com";
		String serviceId = "77md0h6wia2";
		String targetId = "user30";
		
		Date now = new Date();
		log.info("now.getTime()>>"+now.getTime());
		String timestamp = Long.toString(now.getTime());
		log.info(timestamp);
		
		URL url=new URL(baseurl+"/api/v1/services/"+serviceId+"/infers/lookup?type=personalRecommend&targetId="+targetId);
		URLConnection urlCon=url.openConnection();
		HttpURLConnection con=(HttpURLConnection)urlCon;
		StringBuffer response=new StringBuffer();
		//con.setRequestProperty("Host", "aitems.apigw.ntruss.com");
		//con.setRequestProperty("Accept", "application/json");
		con.setRequestProperty("x-ncp-iam-access-key", ACCESSKEY);
		String signature = makeAitemsSignature(timestamp,serviceId,targetId);
		log.info("signature===>"+signature);
		con.setRequestProperty("x-ncp-apigw-signature-v2", signature);
		con.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
		//con.setRequestMethod("GET");//요청방식 설정
		con.connect();
		
		//https://aitems.apigw.ntruss.com/api/v1/services/{serviceId}/infers/lookup?type={type}&targetId={targetId}<<요청 url method=GET
		//serviceId = 생성한 서비스이름
		//type = personalRecommend(개인화 추천), relatedItem(연관상품추천), pop(인긴항목추천) 중에 선택
		//targetId = 조회할 ID
		String responseData = "";
		int responseCode=con.getResponseCode();
		log.info("responseCode===="+responseCode);
		BufferedReader br;
		if(responseCode==200) {
			br=new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
		}else {
			log.info("Error발생: "+responseCode);
			br=new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
		}
		while((responseData=br.readLine()) != null) {
			response.append(responseData);
		}
		log.info("response====>>>"+response);
		AitemsTest(response);
		
	}
	//https://api-fin.ncloud-docs.com/docs/common-ncpapi 시그니처키 생성가이드
	public String makeAitemsSignature(String ts,String serviceId,String targetId) throws Exception{
		String space = " ";					// one space
		String newLine = "\n";					// new line
		String method = "GET";					// method
		String url = "/api/v1/services/"+serviceId+"/infers/lookup?type=personalRecommend&targetId="+targetId;// url (include query string)
		String timestamp = ts;			// current timestamp (epoch)
		String accessKey = ACCESSKEY;			// access key id (from portal or sub account)
		String secretKey = SECRETKEY;

		String message = new StringBuilder()
			.append(method)
			.append(space)
			.append(url)
			.append(newLine)
			.append(timestamp)
			.append(newLine)
			.append(accessKey)
			.toString();

		SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
		Mac mac = Mac.getInstance("HmacSHA256");
		mac.init(signingKey);

		byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
		String encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
		//Base64.encodeBase64String(rawHmac); <<사용시 commons-codec-1.5.jar 파일 다운받아야되서 귀찮음
		//자바 util에 Base64 사용
		
	  return encodeBase64String;
	}
	
	public List<Space_InfoVO> AitemsTest(StringBuffer values) throws Exception{
		JSONParser jp = new JSONParser();
		JSONObject jobj = new JSONObject(); 
		jobj = (JSONObject) jp.parse(values.toString());
		
		log.info("jobj>>"+jobj);
		log.info("jobj.values===>>"+jobj.get("values"));
		JSONArray arr = (JSONArray) jobj.get("values");
		log.info(arr);
		
		List<Space_InfoVO> PRArr = new ArrayList<>(); //추천된 공간리스트
		int j = 0;
		for(Object i : arr) {
			//PRArr.add((String)i);
			PRArr.add(sMapper.selectBySnum(Integer.parseInt((String)i)));
			log.info(PRArr.get(j));
			j++;
			//sMapper.selectBySnum(Integer.parseInt((String)i));
			//selectBySnum
		}
		return PRArr;
	}
}
