package com.project.space.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Space_InfoVO {
	private int snum;  //공간번호 pk
	private String sname; /* 공간명칭 */
	private String userid; //회원아이디
	private int minn; /* 최소인원 */
	private int maxn; /* 최다인원 */
	private int bcost; /* 기본비용 */
	private int ecost; /* 인원추가금 */
	private String spost;
	private String saddr1;
	private String saddr2;
	private String slong;
	private String slat;
	private Date sdate;
	private int h_code;  //해시태그 fk
	private String simage1;
	private String simage2;
	private String simage3;
	private String simage4;
	private String scontents;
	private String srule;
	
	
}
