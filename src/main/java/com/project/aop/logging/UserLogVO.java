package com.project.aop.logging;

public class UserLogVO {
	String date;
	String userid;
	String methodname; // 메서드명 or 컨트롤러명
	String action; //클릭 , ajax로 보기,
	String viewname; //
	String param; //요청파라미터
	String resultValue; //결과값 성공유무 실패시 에러코드뭔지
	String runningtime; //소요시간
	String connectpath; //접속경로
}
