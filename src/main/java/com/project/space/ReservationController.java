package com.project.space;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.space.reservation.Schedule;

@Controller
public class ReservationController {
	
	@RequestMapping(value = "/Reservation", method=RequestMethod.GET)
	public String calendar(Model m, HttpServletRequest req, Schedule sch) {
		
		Calendar cal=Calendar.getInstance();
		Schedule schedule;
		
		if(sch.getDate().equals("") && sch.getMonth().equals("")) {
			sch=new Schedule(String.valueOf(cal.get(Calendar.YEAR)), 
					String.valueOf(cal.get(Calendar.MONTH)+1), String.valueOf(cal.get(Calendar.DATE)), null);
		}
		System.out.println("sch====="+sch);
		Map<String, Integer> today_info=sch.today_info(sch);
		List<Schedule> dateList=new ArrayList<>();
		
		for(int i=1; i<today_info.get("start"); i++) {
			schedule=new Schedule(null,null,null,null);
			dateList.add(schedule);
		}
		
		for(int i=today_info.get("startDay"); i<=today_info.get("endDay"); i++) {
			if(i==today_info.get("today")) {
				System.out.println(i+"/"+today_info.get("today"));
				schedule=new Schedule(String.valueOf(sch.getYear()), String.valueOf(sch.getMonth()), String.valueOf(i), "today");
			}else {
				schedule=new Schedule(String.valueOf(sch.getYear()), String.valueOf(sch.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(schedule);
		}
		
		int index=7-dateList.size()%7;
		if(dateList.size()%7!=0) {
			for(int i=0;i<index;i++) {
				schedule=new Schedule(null,null,null,null);
				dateList.add(schedule);
			}
		}
		System.out.println(dateList);
		
		m.addAttribute("dateList", dateList);
		m.addAttribute("today_info", today_info);
		return "ajax/Res3";
	}
	
	@RequestMapping(value = "/ReservationAjax", method=RequestMethod.GET)
	public String calendarAjax(Model m, HttpServletRequest req, Schedule sch) {
		
		Calendar cal=Calendar.getInstance();
		Schedule schedule;
		
		if(sch.getDate().equals("") && sch.getMonth().equals("")) {
			sch=new Schedule(String.valueOf(cal.get(Calendar.YEAR)), 
					String.valueOf(cal.get(Calendar.MONTH)+1), String.valueOf(cal.get(Calendar.DATE)), null);
		}
		System.out.println("sch====="+sch);
		Map<String, Integer> today_info=sch.today_info(sch);
		List<Schedule> dateList=new ArrayList<>();
		
		for(int i=1; i<today_info.get("start"); i++) {
			schedule=new Schedule(null,null,null,null);
			dateList.add(schedule);
		}
		
		for(int i=today_info.get("startDay"); i<=today_info.get("endDay"); i++) {
			if(i==today_info.get("today")) {
				System.out.println(i+"/"+today_info.get("today"));
				schedule=new Schedule(String.valueOf(sch.getYear()), String.valueOf(sch.getMonth()), String.valueOf(i), "today");
			}else {
				schedule=new Schedule(String.valueOf(sch.getYear()), String.valueOf(sch.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(schedule);
		}
		
		int index=7-dateList.size()%7;
		if(dateList.size()%7!=0) {
			for(int i=0;i<index;i++) {
				schedule=new Schedule(null,null,null,null);
				dateList.add(schedule);
			}
		}
		System.out.println(dateList);
		
		m.addAttribute("dateList", dateList);
		m.addAttribute("today_info", today_info);
		return "ajax/Res3";
	}
	
	
	
}
