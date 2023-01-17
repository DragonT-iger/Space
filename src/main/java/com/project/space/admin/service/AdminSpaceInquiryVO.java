package com.project.space.admin.service;

import lombok.Data;

@Data
public class AdminSpaceInquiryVO {
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
	private String sdate;
	private int h_code;  //해시태그 fk
	private String h_name;
	private String simage1;
	private String simage2;
	private String simage3;
	private String simage4;
	private String scontents;
	private String srule;
	private String rescount; //예약횟수
	
	public String getRescount() {
		if(this.rescount==null) {
			return "0";
		}else
			return this.rescount;
	}
	public String getSdate() {
		return this.sdate.substring(0, 10);
	}
}
