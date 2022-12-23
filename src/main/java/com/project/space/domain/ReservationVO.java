package com.project.space.domain;

import lombok.Data;

@Data
public class ReservationVO {  //공간 예약하기
	private int rtnum;  //예약번호
	private int snum;  //공간번호
	private String userid;  //회원아이디
	private String rtstartdate;  //예약시작날짜
	private String rtstart;  //예약시작시간
	private String rtend;  //예약종료시간
	private String rtenddate;  //예약종료날짜
	private int rtnumber;  //예약인원
	private int rtstatus;  //예약상태
}
