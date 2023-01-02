package com.project.space.reservation;

public class Payment {
	
	private int snum; //공간정보
	private String userid; //유저 아이디
	private String mname;  //유저 성함
	private String userHP;  //유저 연락처
	
	private String rtdate; //예약 날짜
	private String rtstartTime;  //예약시작시간
	private String rtendTime;  //예약종료시간
	private int rtCount;  //예약 인원
	
	//예약시간
	private int TotalTime;  //rtend-rtstart ==> 총 대여 시간
	
	public void setTotalTime(String rtstartTime, String rtendTime) {
		this.rtstartTime=rtstartTime;
		this.rtendTime=rtendTime;
		//
		this.TotalTime=Integer.parseInt(rtendTime)-Integer.parseInt(rtstartTime);
	}
	
	//예약금액view
	private int TimePrice;  //bcost*TotalTime ==> 시간당 금액
	private int CountPrice;  //ecost*(rtnumber-minn) ==> 인원추가금 / if((rtnumber-minn)<1)
	private int TotalPrice;  //TimePrice+CountPrice ==> 총 결제 금액
		
}
