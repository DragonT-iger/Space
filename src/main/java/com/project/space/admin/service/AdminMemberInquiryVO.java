package com.project.space.admin.service;


import lombok.Data;

@Data
public class AdminMemberInquiryVO {
	private String mname; /* 이름 */
	private String nickname; /* 닉네임 */  //unique
	private String userid; /* 회원아이디 */  //pk
	private String mpwd; /* 비밀번호 */
	private String hp; /* 연락처 */
	private int birth;  /* 생년월일 */
	private String mdate; /* 가입일자 */
	private int status; /* 회원상태 */
	private int point; /* 포인트 */
	private int mrank; /* 회원등급 (mem_rank_fk) */
	private long account; /* 계좌정보 */
	private String statusStr;
	//여기 적었던 회원 포인트 누적계산 날라갔거든요 이거 추가해야되요
	private int pointadd; //누적포인트
	private String rcount; //예약횟수
	

	public String getRcount() {
		if(this.rcount==null) {
			return "0";
		}else
			return this.rcount;
	}
	public String getMdate() {
		return this.mdate.substring(0, 10);
	}
}


