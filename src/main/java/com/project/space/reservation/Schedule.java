package com.project.space.reservation;

import static java.util.Calendar.DATE;
import static java.util.Calendar.DAY_OF_MONTH;
import static java.util.Calendar.DAY_OF_WEEK;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import com.project.space.domain.ReservationVO;

public class Schedule {
	private int snum;
	private String year="";
	private String month="";
	private String date="";
	private String value="";
	
	private String db_Date="";
	private String db_startTime="";
	private String db_endTime="";
	ReservationVO[] schedule_date_arr=new ReservationVO[4];
	
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum = snum;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getDb_Date() {
		return db_Date;
	}
	public void setDb_startDate(String db_Date) {
		this.db_Date = db_Date;
	}
	public String getDb_startTime() {
		return db_startTime;
	}
	public void setDb_startTime(String db_startTime) {
		this.db_startTime = db_startTime;
	}
	public String getDb_endTime() {
		return db_endTime;
	}
	public void setDb_endTime(String db_endTime) {
		this.db_endTime = db_endTime;
	}
	public ReservationVO[] getSchedule_date_arr() {
		return schedule_date_arr;
	}
	public void setSchedule_date_arr(ReservationVO[] schedule_date_arr) {
		this.schedule_date_arr = schedule_date_arr;
	}
	
	private String YMD;  //db에 저장된 값과 맞춰주기
	public String getYMD() {
		this.YMD=year+month+date;
		return YMD;
	}
	
	public Schedule(){
		
	}
	
	public Schedule(String year, String month, String date, String value, ReservationVO[] schedule_date_arr) {
		if((month!=null && month!="") && (date!=null && date!="")) {
			this.year = year;
			this.month = month;
			this.date=date;
			this.value=value;
			this.schedule_date_arr=schedule_date_arr;
		}
	}
	
	/*
	public Schedule(String year, String month, String date, String value, String schedule, String schedule_detail) {
		this.year = year;
		this.month = month;
		this.date = date;
		this.value = value;
		this.schedule = schedule;
		this.schedule_detail = schedule_detail;
	}
	*/
	
	@Override
	public String toString() {
		return "***Schedule [year=" + year + ", month=" + month + ", date=" + date + ", value=" + value+", schedule=" + this.getSchedule_date_arr() +"]";
	}
	
	//날짜 관련 달력 정보
	public Map<String, Integer> today_info(Schedule sch){  
		Map<String, Integer> today_data=new HashMap<>();  //날짜 캘린더 함수 삽입
		Calendar cal=Calendar.getInstance();  //java의 calendar클래스로 cal이란 이름
		cal.set(Integer.parseInt(sch.getYear()), Integer.parseInt(sch.getMonth())-1, 1);
		
		int startDay=cal.getMinimum(DATE);  //1일 시작
		System.out.println("달의 시작=="+startDay);
		int endDay=cal.getActualMaximum(DAY_OF_MONTH);  //달의 끝
		System.out.println("달의 끝=="+endDay);
		int start=cal.get(DAY_OF_WEEK);  //몇주 있는지
		System.out.println("달의 주차=="+start);
		
		Calendar todayCal=Calendar.getInstance();  //캘린더 클래스
		SimpleDateFormat ysdf=new SimpleDateFormat("yyyy");  //년도
		SimpleDateFormat msdf=new SimpleDateFormat("M");  //월
		
		int today_year=Integer.parseInt(ysdf.format(todayCal.getTime()));
		int today_month=Integer.parseInt(msdf.format(todayCal.getTime()));
		
		int search_year=(sch.getYear()!=null && !sch.getYear().isEmpty())?Integer.parseInt(sch.getYear()):today_year;
		int search_month=(sch.getMonth()!=null && !sch.getMonth().isEmpty())?Integer.parseInt(sch.getMonth()):today_month;
//		int search_month=(!schedule.getMonth().isEmpty())?Integer.parseInt(schedule.getMonth())+1:today_month;
		
		int today=1;
		System.out.println(search_year+"******"+search_month+"/"+today_year+"***"+today_month);
		if(today_year==search_year && today_month==search_month) {
			SimpleDateFormat dsdf=new SimpleDateFormat("dd");
			today=Integer.parseInt(dsdf.format(todayCal.getTime()));
		}
//		search_month=search_month-1;
		
		Map<String, Integer> bac=before_after_calendar(search_year, search_month);
		
		System.out.println(today);
		
		if(search_month==0) {
			search_month=12;
			search_year=search_year-1;
		}
		
		System.out.println("search_month: "+search_month);
		
		today_data.put("start", start);
		today_data.put("startDay", startDay);
		today_data.put("endDay", endDay);
		today_data.put("today", today);
		today_data.put("search_year", search_year);
		today_data.put("search_month", search_month);
		today_data.put("before_year", bac.get("before_year"));
		today_data.put("before_month", bac.get("before_month"));
		today_data.put("after_year", bac.get("after_year"));
		today_data.put("after_month", bac.get("after_month"));
		
		return today_data;
	}
	
	private Map<String, Integer> before_after_calendar(int search_year, int search_month) {
		Map<String, Integer> badata=new HashMap<>();
		int before_year=search_year;
		int before_month=search_month-1;
		int after_year=search_year;
		int after_month=search_month;
		
		if(before_month<0) {
			before_month=11;
			before_year=search_year-1;
		}
		System.out.println(before_month+" :이전달, 이전년도: "+before_year);
		
		if(after_month>11) {
			after_month=0;
			after_year=search_year+1;
		}
		System.out.println(after_month+" :다음달, 다음년도: "+after_year);
		
		if(after_month==0 && before_month==11) {
			search_month=12;
		}
		System.out.println(before_month+" :전달, 다음달: "+after_month);
		
		if(after_month==1 && before_month==0) {
			before_month=12;
			before_year=search_year-1;
		}
		System.out.println(before_month+" :전달, 다음달: "+after_month);
		
		badata.put("before_year", before_year);
		badata.put("before_month", before_month);
		badata.put("after_year", after_year);
		badata.put("after_month", after_month);
		return badata;
	}
	
	
	
}
