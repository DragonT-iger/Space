package com.project.space.reservation;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpHeaders;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.springframework.http.HttpEntity;
import org.springframework.http.MediaType;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.RequiredArgsConstructor;
import lombok.Value;

@RequiredArgsConstructor
@Service
public class SmsService {

	/*
	 * @Value("${naver-cloud-sms.accessKey}") private String accessKey;
	 * 
	 * @Value("${naver-cloud-sms.secretKey}") private String secretKey;
	 * 
	 * @Value("${naver-cloud-sms.serviceId}") private String serviceId;
	 * 
	 * @Value("${naver-cloud-sms.senderPhone}") private String phone;
	 * 
	 * public SmsResponseDTO sendSms(String recipientHP, String content) throws
	 * JsonProcessingException, RestClientException, URISyntaxException,
	 * InvalidKeyException, NoSuchAlgorithmException, UnsupportedEncodingException {
	 * //현재 시간 Long time = System.currentTimeMillis(); List<MessageDTO> messages =
	 * new ArrayList<>(); messages.add(new MessageDTO(recipientHP, content));
	 * 
	 * //헤더 세팅 HttpHeaders headers = new HttpHeaders();
	 * headers.setContentType(MediaType.APPLICATION_JSON);
	 * headers.set("x-ncp-apigw-timestamp", time.toString());
	 * headers.set("x-ncp-iam-access-key", this.accessKey);
	 * headers.set("x-ncp-apigw-signature-v2", makeSignature(time));
	 * 
	 * SmsRequestDTO request = new SmsRequestDTO("SMS", "COMM", "82", phone,
	 * "MangoLtd", messages);
	 * 
	 * SmsRequestDTO request = SmsRequestDTO.builder() .type("SMS")
	 * .contentType("COMM") .countryCode("82") .from(phone) .content("MangoLtd")
	 * .messages(messages) .build();
	 * 
	 * 
	 * //request를 json형태로 body로 변환 ObjectMapper objectMapper = new ObjectMapper();
	 * String body = objectMapper.writeValueAsString(request); //body와 header를 합친다
	 * HttpEntity<String> httpBody = new HttpEntity<>(body, headers);
	 * 
	 * RestTemplate restTemplate = new RestTemplate();
	 * restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
	 * //restTemplate를 통해 외부 api와 통신
	 * 
	 * SmsResponseDTO response = restTemplate.postForObject(new
	 * URI("https://sens.apigw.ntruss.com/sms/v2/services/"+ serviceId
	 * +"/messages"), httpBody, SmsResponseDTO.class);
	 * 
	 * return response; }
	 * 
	 * 
	 * public String makeSignature(Long time) throws NoSuchAlgorithmException,
	 * UnsupportedEncodingException, InvalidKeyException{ String space = " "; // one
	 * space String newLine = "\n"; // new line String method = "POST"; // method
	 * String url = "/sms/v2/services/"+this.serviceId+"/messages"; // url (include
	 * query string) String timestamp = time.toString(); // current timestamp
	 * (epoch) String accessKey = this.accessKey; // access key id (from portal or
	 * Sub Account) String secretKey = this.secretKey;
	 * 
	 * String message = new StringBuilder() .append(method) .append(space)
	 * .append(url) .append(newLine) .append(timestamp) .append(newLine)
	 * .append(accessKey) .toString();
	 * 
	 * SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"),
	 * "HmacSHA256"); Mac mac = Mac.getInstance("HmacSHA256"); mac.init(signingKey);
	 * 
	 * byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8")); String
	 * encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
	 * 
	 * return encodeBase64String; }
	 * 
	 * 
	 */

}
