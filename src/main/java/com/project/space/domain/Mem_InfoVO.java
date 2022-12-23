package com.project.space.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Mem_InfoVO {
	private String mname; /* 이름 */
	private String nickname; /* 닉네임 */  //unique
	private String userid; /* 회원아이디 */  //pk
	private String mpwd; /* 비밀번호 */
	private String hp; /* 연락처 */
	private int birth;  /* 생년월일 */
	private Date mdate; /* 가입일자 */
	private int status; /* 회원상태 */
	private int point; /* 포인트 */
	private int mrank; /* 회원등급 (mem_rank_fk) */
	private int account; /* 계좌정보 */
	
}
