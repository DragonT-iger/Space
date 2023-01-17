package com.project.space.domain;

import lombok.Data;

@Data
public class FeedbackVO {
	private int fnum; //피드백 넘버
	private int rtnum; //예약번호
	private int snum; //공간
	private String userid;  //환불유저
	private int r_code; //사유
	private String etc; //기타
	
	private String r_content; 
	private int totalprice;
	private String sname;
}
