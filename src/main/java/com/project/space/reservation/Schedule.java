package com.project.space.reservation;

import static java.util.Calendar.DATE;
import static java.util.Calendar.DAY_OF_MONTH;
import static java.util.Calendar.DAY_OF_WEEK;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

public class Schedule {
	private String year="";
	private String month="";
	private String date="";
	private String value="";
	
	private String schedule;
	private String schedule_detail;
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
	public String getSchedule() {
		return schedule;
	}
	public void setSchedule(String schedule) {
		this.schedule = schedule;
	}
	public String getSchedule_detail() {
		return schedule_detail;
	}
	public void setSchedule_detail(String schedule_detail) {
		this.schedule_detail = schedule_detail;
	}
	
	public Schedule(){
		
	}
	
	public Schedule(String year, String month, String date, String value) {
		if((month!=null && month!="") && (date!=null && date!="")) {
			this.year = year;
			this.month = month;
			this.date=date;
			
		}
		this.value=value;
	}
	
	public Schedule(String year, String month, String date, String value, String schedule, String schedule_detail) {
		this.year = year;
		this.month = month;
		this.date = date;
		this.value = value;
		this.schedule = schedule;
		this.schedule_detail = schedule_detail;
	}
	
	@Override
	public String toString() {
		return "Schedule [year=" + year + ", month=" + month + ", date=" + date + ", value=" + value + "]";
	}
	
	//날짜 관련 달력 정보
	public Map<String, Integer> today_info(Schedule sch){  
		Map<String, Integer> today_data=new HashMap<>();  //날짜 캘린더 함수 삽입
		Calendar cal=Calendar.getInstance();  //java의 calendar클래스로 cal이란 이름
		cal.set(Integer.parseInt(sch.getYear()), Integer.parseInt(sch.getMonth())-1, 1);
		
		int startDay=cal.getMinimum(DATE);
//		System.out.println(startDay);
		int endDay=cal.getActualMaximum(DAY_OF_MONTH);
//		System.out.println(endDay);
		int start=cal.get(DAY_OF_WEEK);
//		System.out.println(start);
		
		Calendar todayCal=Calendar.getInstance();
		SimpleDateFormat ysdf=new SimpleDateFormat("yyyy");
		SimpleDateFormat msdf=new SimpleDateFormat("M");
		
		int today_year=Integer.parseInt(ysdf.format(todayCal.getTime()));
		int today_month=Integer.parseInt(msdf.format(todayCal.getTime()));
		
		int search_year=(sch.getYear()!=null && !sch.getYear().isEmpty())?Integer.parseInt(sch.getYear()):today_year;
		int search_month=(sch.getMonth()!=null && !sch.getMonth().isEmpty())?Integer.parseInt(sch.getMonth()):today_month;
//		int search_month=(!schedule.getMonth().isEmpty())?Integer.parseInt(schedule.getMonth())+1:today_month;
		
		int today=-1;
		System.out.println(search_year+"******"+search_month+"/"+today_year+"***"+today_month);
		if(today_year==search_year && today_month==search_month) {
			SimpleDateFormat dsdf=new SimpleDateFormat("dd");
			today=Integer.parseInt(dsdf.format(todayCal.getTime()));
		}
		search_month=search_month-1;
		
		Map<String, Integer> bac=before_after_calendar(search_year, search_month);
		
		System.out.println(today);
		System.out.println("search_month: "+search_month);
		
		value="today";
		
		today_data.put("start", start);
		today_data.put("startDay", startDay);
		today_data.put("endDay", endDay);
		today_data.put("today", today);
		today_data.put("search_year", search_year);
		today_data.put("search_month", search_month+1);
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
		int after_month=search_month+1;
		
		if(before_month<0) {
			before_month=11;
			before_year=search_year-1;
		}
		
		if(after_month>11) {
			after_month=0;
			after_year=search_year+1;
		}
		
		badata.put("before_year", before_year);
		badata.put("before_month", before_month);
		badata.put("after_year", after_year);
		badata.put("after_month", after_month);
		return badata;
	}
	
	
	
}
