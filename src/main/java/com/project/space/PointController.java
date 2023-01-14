package com.project.space;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.space.domain.Mem_InfoVO;
import com.project.space.domain.PointVO;
import com.project.space.domain.ReservationVO;
import com.project.space.point.service.PointService;
import com.project.space.reservation.service.ReservationService;
import com.project.space.user.service.Mem_InfoService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class PointController {
	
	@Inject
	private Mem_InfoService meminfoService;
	
	@Inject
	private PointService pointService;
	
	@Inject
	private ReservationService reservationService;

//	@GetMapping(value="/user/pointAdd")
//	public String pointAdd(Model m, HttpSession ses) {
//		Mem_InfoVO mvo=(Mem_InfoVO)ses.getAttribute("loginUser"); //�꽭�뀡�뿉 ���옣�맂 濡쒓렇�씤 �젙蹂�
//		String mvoId=mvo.getUserid();  //濡쒓렇�씤�맂 �쑀�� 爰쇰궡�삤湲�
//		log.info("�뱾�뼱�삩 �쉶�썝 �븘�씠�뵒: "+mvoId);
//		
//		Mem_InfoVO mivo=this.meminfoService.getUser(mvoId); //�쉶�썝�젙蹂�
//		List<PointVO> pvoArr=this.pointService.getPointUser(mvoId); //�룷�씤�듃 異⑹쟾�궡�뿭
//		List<ReservationVO> resArr=this.reservationService.userBookingInfo(mvoId); //�삁�빟�븳 怨듦컙�젙蹂�(�룷�씤�듃 �궗�슜泥�)
//		int resPrice=this.reservationService.userBookingTotalprice(mvoId); //珥� �삁�빟 �룷�씤�듃 �빀怨�
//		
//		m.addAttribute("mivo", mivo);
//		m.addAttribute("pvoArr", pvoArr);
//		m.addAttribute("resArr", resArr);
//		m.addAttribute("resPrice", resPrice);
//		return "ajax/Reservation/pointAdd";
//	}
	
	
}
