package com.project.space;

import java.io.UnsupportedEncodingException;
import java.net.URISyntaxException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestClientException;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.project.space.admin.service.AdminSpaceInquiryVO;
import com.project.space.domain.FeedbackVO;
import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.PointVO;
import com.project.space.domain.ReasonVO;
import com.project.space.domain.ReservationVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.domain.mem_space_res_view;
import com.project.space.reservation.MessageDTO;
import com.project.space.reservation.Schedule;
import com.project.space.reservation.SmsResponseDTO;
import com.project.space.reservation.SmsService;
import com.project.space.reservation.service.ReservationService;
import com.project.space.spaceinfo.service.SpaceInfoService;
import com.project.space.user.service.Mem_InfoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class JYController {
	
	@Inject
	private SpaceInfoService spaceinfoService;
	
	@Inject
	private ReservationService reservationService;
	
	@Inject
	private Mem_InfoService meminfoService;
	
	@Inject
	private SmsService smsService;
	
	@GetMapping(value="/Reservation")
	public String resSpace(Model m, @RequestParam(defaultValue="0") int snum, HttpSession ses) {
		log.info("snum: "+snum);
		
		ses.setAttribute("snum", snum);  //세션에 snum 저장
		
		Space_InfoVO svo=this.spaceinfoService.selectBySnum(snum);
		
		Date nowTime=new Date();
		SimpleDateFormat sf=new SimpleDateFormat("yyyyMMdd");
		String now=sf.format(nowTime);
		log.info("now: "+now);
		m.addAttribute("now", now);
		
		log.info(svo+"<<<<공간번호");
		m.addAttribute("svo",svo);
		ses.setAttribute("svo", svo);
		return "ajax/Reservation/ReservationMain1";
	}
	
	@RequestMapping(value = "/ReservationAjax", method=RequestMethod.GET)
	public String calendarAjax(Model m, HttpServletRequest req, Schedule sch) {
		Calendar cal=Calendar.getInstance();
		Schedule schedule;
		
		if(sch.getDate().equals("") && sch.getMonth().equals("")) {
			sch=new Schedule(String.valueOf(cal.get(Calendar.YEAR)), 
					String.valueOf(cal.get(Calendar.MONTH)+1), String.valueOf(cal.get(Calendar.DATE)), null, null);
		}
		System.out.println("sch스케줄에 입력된 값====="+sch);
		Map<String, Integer> today_info=sch.today_info(sch);
		List<Schedule> dateList=new ArrayList<>();
		
		//스케줄

		HttpSession ses=req.getSession();
		Space_InfoVO svo=(Space_InfoVO)ses.getAttribute("svo"); //세션에 저장된 공간 넘버
		log.info("svo: "+svo);
		sch.setSnum(svo.getSnum());

		List<ReservationVO> sch_list=reservationService.CalbookingInfo(sch);

		ReservationVO[][] schedule_data_arr=new ReservationVO[32][4];
		if(!sch_list.isEmpty()) {
			int s=0;
			for(int i=0;i<sch_list.size();i++) {
				int date = Integer.parseInt(String.valueOf(sch_list.get(i).getRtstartdate())
						.substring(String.valueOf(sch_list.get(i).getRtstartdate()).length()-2,String.valueOf(sch_list.get(i).getRtstartdate()).length()));
				if(i>0) {
					int date_before = Integer.parseInt(String.valueOf(sch_list.get(i-1).getRtstartdate())
							.substring(String.valueOf(sch_list.get(i-1).getRtstartdate()).length()-2,String.valueOf(sch_list.get(i-1).getRtstartdate()).length()));
				
					if(date_before==date) {
						s=s+1;
						schedule_data_arr[date][s]=sch_list.get(i);
					}else {
						s=0;
						schedule_data_arr[date][s]=sch_list.get(i);
					}
				}else {
					schedule_data_arr[date][s]=sch_list.get(i);
				}
			}
		}
		
		
		for(int i=1; i<today_info.get("start"); i++) {
			schedule=new Schedule(null,null,null,null,null);
			dateList.add(schedule);
		}
		
		for(int i=today_info.get("startDay"); i<=today_info.get("endDay"); i++) {
			ReservationVO[] sch_date_arr3=new ReservationVO[4];
			sch_date_arr3=schedule_data_arr[i];
			
			if(i==today_info.get("today")) {
				System.out.println(i+"/"+today_info.get("today"));
				schedule=new Schedule(String.valueOf(sch.getYear()), String.valueOf(sch.getMonth()), String.valueOf(i), "today", sch_date_arr3);
			}else {
				schedule=new Schedule(String.valueOf(sch.getYear()), String.valueOf(sch.getMonth()), String.valueOf(i), "normal_date", sch_date_arr3);
			}
			dateList.add(schedule);
		}
		
		int index=7-dateList.size()%7;
		if(dateList.size()%7!=0) {
			for(int i=0;i<index;i++) {
				schedule=new Schedule(null,null,null,null,null);
				dateList.add(schedule);
			}
		}
		System.out.println(dateList);
		
		m.addAttribute("dateList", dateList);
		m.addAttribute("today_info", today_info);
		req.getSession().setAttribute("today_info", today_info);
		return "ajax/Reservation/ReservationAjax";
	}
	
	
	
	@PostMapping(value="/ReservationModal", produces="application/json")
	@ResponseBody
	public ModelMap ReservationModal(@RequestBody Map<String,String> pay) {
		log.info("세팅전"+pay);
		ReservationVO rvo=new ReservationVO();
		rvo.setSnum(Integer.parseInt(pay.get("rtspace")));  //공간번호
		rvo.setUserid(pay.get("rtuser")); //회원아이디
		rvo.setRtstartdate(pay.get("rtyear"), pay.get("rtmonth"), pay.get("rtdate"));  //날짜합치기
		rvo.setRtstart(pay.get("rtstartTime")); //시작시간
		rvo.setRtend(pay.get("rtendTime"));  //종료시간
		rvo.setTotalTime(pay.get("rtstartTime"), pay.get("rtendTime")); //대여시간
		rvo.setRtnumber(Integer.parseInt(pay.get("rtcount")));  //예약인원
		rvo.setCountprice(Integer.parseInt(pay.get("rtcount")), Integer.parseInt(pay.get("rtminn")), Integer.parseInt(pay.get("rtecost"))); //인원추가금
		rvo.setTimePrice(rvo.getTotalTime(), Integer.parseInt(pay.get("rtbcost"))); //시간당금액
		rvo.setTotalPrice(rvo.getCountPrice(), rvo.getTimePrice()); //총 예약금액
		log.info("세팅후"+rvo);
		
//		Mem_InfoVO pointM=this.meminfoService.getUser(pay.get("rtuser"));
		ModelMap m=new ModelMap();
		
		int cst=Integer.parseInt(rvo.getRtstart().substring(0, 2));
		log.info("가공한 startTime"+cst);
		int ced=Integer.parseInt(rvo.getRtend().substring(0, 2));
		log.info("가공한 endTime"+ced);
		
		List<ReservationVO> TimeT=reservationService.bookingTimeInfo(rvo);
		log.info("db불러오기"+TimeT);
		int dst[]=new int[TimeT.size()];
		int ded[]=new int[TimeT.size()];
		
		if(TimeT!=null && TimeT.size()!=0) {
			for(int i=0;i<TimeT.size();i++) {
				dst[i]=Integer.parseInt(TimeT.get(i).getRtstart().substring(0,2));
				log.info("db 시작시간 세팅=="+dst);
				ded[i]=Integer.parseInt(TimeT.get(i).getRtend().substring(0,2));
				log.info("db 끝시간 세팅=="+ded);
				if(cst!=dst[i] && cst!=ded[i] && ced!=dst[i] && ced!=ded[i]) {
					while(cst<ded[i]) {
						if(ced<dst[i]) {
							m.addAttribute("result",rvo);
							return m;
						}else {
							m.addAttribute("result",0);
							return m;
						} //if
					} //while
				}else {
					m.addAttribute("result",0);
					return m;
				} //if
			} //for
		} //if
		m.addAttribute("result",rvo);
		return m;
	}
	
	@PostMapping(value="/ReservationPayment")
	public String ReservationPayment(Model m, HttpSession ses, @ModelAttribute ReservationVO rtvo, @ModelAttribute("messageDto") MessageDTO messageDto) 
			throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, 
			UnsupportedEncodingException, HttpClientErrorException {
		log.info("rtvo insert=="+rtvo);
		log.info("message: "+messageDto);
		
		SimpleDateFormat sf=new SimpleDateFormat("yyyy년 MM월 dd일");
		String date=sf.format(rtvo.getRtstartdate());
		messageDto.setContent(rtvo.getUserid()+"님 "+date+"로 예약이 완료되었습니다");
		
		int res=this.reservationService.insertBooking(rtvo);
		
		if(res>0) {
			int uur=this.reservationService.updateUserRes(rtvo); //예약자 포인트 차감
			if(uur>0) {
				PointVO check=new PointVO();
				Space_InfoVO svo=this.spaceinfoService.selectBySnum(rtvo.getSnum());
		        check.setUserid(svo.getUserid());
		        check.setPlusPoint(rtvo.getTotalprice());
		        int usp=this.reservationService.PlusSpacePoint(check); //호스트 포인트 +
			}
			//SmsResponseDTO response = smsService.sendSms(messageDto);
		}

		String str=(res>0)? "예약이 완료되었습니다":"잔여 포인트를 확인해 주세요";
		String loc=(res>0)? "/space/user/MyReservation":"/space/user/pointAdd";
		
		m.addAttribute("message", str);
		m.addAttribute("loc", loc);
		return "msg";
	}
	

	@RequestMapping(value = "/user/MyReservation", method = RequestMethod.GET)
	public String myreservation(Model m, HttpServletRequest req) {
		log.info("connected myreservation.");
		
		HttpSession ses=req.getSession();
		Mem_InfoVO rvo=(Mem_InfoVO)ses.getAttribute("loginUser"); //세션에 저장된 유저 아이디 정보
		log.info("rvo: "+rvo);
		List<mem_space_res_view> resArr=this.reservationService.BookingView(rvo.getUserid());
		
		Date nowTime=new Date();
		SimpleDateFormat sf=new SimpleDateFormat("yyyyMMdd");
		String now=sf.format(nowTime);
		log.info("now: "+now);
		
		m.addAttribute("resArr", resArr);
		m.addAttribute("now", now);
		
		return "ajax/Pages/MyReservation";
	}
	
	@GetMapping("/user/DelReservation")
	public String DelResModal(Model m, @RequestParam(defaultValue="0") int rtnum) {
		log.info("rtnum=="+rtnum);

		ReservationVO drvo=this.reservationService.getBooking(rtnum);
		Space_InfoVO sivo=this.spaceinfoService.selectBySnum(drvo.getSnum());
		m.addAttribute("drvo", drvo);
		m.addAttribute("sivo", sivo);
		return "ajax/Reservation/DelReservation";
	}
	
	@PostMapping(value="/DelR")
	public String DeleteReservation(Model m, @ModelAttribute FeedbackVO fbvo, @ModelAttribute("messageDto") MessageDTO messageDto) 
			throws JsonProcessingException, RestClientException, URISyntaxException, InvalidKeyException, NoSuchAlgorithmException, 
			UnsupportedEncodingException, HttpClientErrorException {
		log.info("fbvo delete=="+fbvo);
		log.info("message: "+messageDto);
		messageDto.setContent(fbvo.getUserid()+"님 예약이 취소되었습니다");
		
		ReservationVO rtvo=this.reservationService.getBooking(fbvo.getRtnum()); //예약내용 불러오기
		fbvo.setTotalprice(rtvo.getTotalprice());
		fbvo.setSnum(rtvo.getSnum());
		log.info("setting fbvo========"+fbvo);
		
		int res=this.reservationService.deleteBooking(fbvo.getRtnum()); //예약취소 상태 변경
		if(res>0) {
			int fb=this.reservationService.insertFeedback(fbvo); //취소사유 피드백
			int up=this.reservationService.updateUserPoint(fbvo); //예약자 포인트 +
			
			PointVO check=new PointVO();
			Space_InfoVO svo=this.spaceinfoService.selectBySnum(fbvo.getSnum());
			check.setUserid(svo.getUserid());
			check.setPlusPoint(rtvo.getTotalprice());
	        int usp=this.reservationService.MinusSpacePoint(check); //호스트 포인트 차감
	        
			//SmsResponseDTO response = smsService.sendSms(messageDto);
			String str="예약이 취소되었습니다";
			String loc="/space/user/MyReservation";
			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			return "msg";
		}else {
			String str="예약 취소 실패";
			String loc="/space/user/MyReservation";
			
			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			return "msg";
		}
	}
	
	@GetMapping("/owner/MyFeedback")
	public String mySpaceEdit(Model m , HttpSession ses) {
		log.info("connected Feedback");
	    String userid = ((Mem_InfoVO)ses.getAttribute("loginUser")).getUserid();
	    
	    List<FeedbackVO> fArr=this.reservationService.checkFeedback(userid);
	    List<Space_InfoVO> sArr=this.spaceinfoService.selectByUserid(userid);
	    List<ReasonVO> rArr=this.reservationService.getReasonAll();
	    m.addAttribute("fArr",fArr);
	    m.addAttribute("sArr",sArr);
	    m.addAttribute("rArr",rArr);
		return "ajax/OwnerPage/MyFeedback";
	}
	
	@PostMapping(value="/owner/searchFeedback" , produces = "application/json")
	@ResponseBody
	public List<FeedbackVO> getsearchFeedback(@RequestBody Map<String,String> filter){
		
		List<FeedbackVO> spaceArr=this.reservationService.searchFeedbackByFilter(filter);
		log.info("memArr==>"+spaceArr);
		return spaceArr;
	}
	
}
