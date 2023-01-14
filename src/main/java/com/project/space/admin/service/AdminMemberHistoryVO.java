package com.project.space.admin.service;

import lombok.Data;

@Data
public class AdminMemberHistoryVO {
	private String userid; /* 회원아이디 */  //pk
	private String rcount; //예약횟수
	private String sname; //공간명
	private String snum; //공간번호
	private String sumtp; //해당공간 사용 총금액
	private String h_name; // 해당공간 해시태그이름
	private String h_code; // 해당공간 해시태그코드
}
