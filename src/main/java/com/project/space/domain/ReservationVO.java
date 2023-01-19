package com.project.space.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationVO {  //공간 예약하기
	private int rtnum;  //예약번호
	private int snum;  //공간번호
	private String userid;  //회원아이디
	private String rtstartdate;  //예약시작날짜
	private String rtstart;  //예약시작시간
	private String rtend;  //예약종료시간
	private int rtnumber;  //예약인원
	private int totalprice;  //TimePrice+CountPrice ==> 총 결제 금액
	private int rtstatus;  //예약상태
	private Date rdate; //예약완료 시간
	
	//예약시간
	private int TotalTime;  //rtend-rtstart ==> 총 대여 시간
	public void setTotalTime(String rtstart, String rtend) {
		this.rtstart=rtstart;
		this.rtend=rtend;
		//
		String rs=rtstart.substring(0, 2);
		String re=rtend.substring(0, 2);
		this.TotalTime=Integer.parseInt(re)-Integer.parseInt(rs);
	}
	
	//날짜 합치기
	private String rtyear; //년
	private String rtmonth; //월
	private String rtdate; //일
	public void setRtstartdate(String rtyear, String rtmonth, String rtdate) {
		this.rtyear=rtyear;
		this.rtmonth=rtmonth;
		this.rtdate=rtdate;
		//
		if(Integer.parseInt(rtmonth)<10) {
			rtmonth="0"+rtmonth;
		}
		if(Integer.parseInt(rtdate)<10) {
			rtdate="0"+rtdate;
		}
		// 
		this.rtstartdate=rtyear+rtmonth+rtdate;
	}
	
	//예약금액 계산
	private int CountPrice;  //ecost*(rtnumber-minn) ==> 인원추가금 / if((rtnumber-minn)<1)
	private int minn;
	private int ecost;
	public void setCountprice(int rtnumber, int minn, int ecost) {
		this.rtnumber=rtnumber;
		this.minn=minn;
		this.ecost=ecost;
		//
		if((rtnumber-minn)>0) {
			this.CountPrice=ecost*(rtnumber-minn);
		}else{
			this.CountPrice=0;
		}
	}
	
	private int TimePrice;  //bcost*TotalTime ==> 시간당 금액
	private int bcost;
	public void setTimePrice(int TotalTime, int bcost) {
		this.TotalTime=TotalTime;
		this.bcost=bcost;
		//
		TimePrice=TotalTime*bcost;
	}
	
	public void setTotalPrice(int CountPrice, int TimePrice) {
		this.CountPrice=CountPrice;
		this.TimePrice=TimePrice;
		//
		this.totalprice=CountPrice+TimePrice;
	}
	
	private String mname; /* 이름 */
	private String hp; /* 연락처 */
	private int rcount;
		
}
