package com.project.space.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor 
@AllArgsConstructor 
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
	private long account; /* 계좌정보 */
	private String statusStr;
	//여기 적었던 회원 포인트 누적계산 날라갔거든요 이거 추가해야되요
	private int pointadd; //누적포인트
	private String bank_code; //은행코드
}
