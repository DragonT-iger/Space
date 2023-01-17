package com.project.space.reservation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.space.domain.FeedbackVO;
import com.project.space.domain.PointVO;
import com.project.space.domain.ReasonVO;
import com.project.space.domain.ReservationVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.domain.mem_space_res_view;
import com.project.space.reservation.Schedule;
import com.project.space.reservation.mapper.ReservationMapper;
import com.project.space.spaceinfo.mapper.SpaceInfoMapper;
import com.project.space.user.mapper.Mem_InfoMapper;

@Service
public class ReservationServiceImp implements ReservationService {
	
	@Autowired
	private SpaceInfoMapper spaceinfoMapper;
	
	@Autowired
	private ReservationMapper reservationMapper;
	
	@Override
	public Space_InfoVO selectBySnum(int snum) {
		return this.spaceinfoMapper.selectBySnum(snum);
	}

	@Override
	public List<ReservationVO> bookingInfo(int snum) {
		return this.reservationMapper.bookingInfo(snum);
	}
	
	@Override
	public List<ReservationVO> CalbookingInfo(Schedule sch) {
		return this.reservationMapper.CalbookingInfo(sch);
	}

	@Override
	public List<ReservationVO> bookingTimeInfo(String rtstartdate) {
		return this.reservationMapper.bookingTimeInfo(rtstartdate);
	}

	@Override
	public List<ReservationVO> userBookingInfo(String userid) {
		return this.reservationMapper.userBookingInfo(userid);
	}

	@Override
	public int insertBooking(ReservationVO rtvo) {
		return this.reservationMapper.insertBooking(rtvo);
	}
	
	@Override
	public int updateUserRes(ReservationVO rtvo) {
		return this.reservationMapper.updateUserRes(rtvo);
	}

	@Override
	public int updateBooking(ReservationVO rtvo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBookingEdit(int snum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBooking(int rtnum) {
		return this.reservationMapper.deleteBooking(rtnum);
	}

	@Override
	public List<ReservationVO> searchBookingInfo(int rtstatus) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReservationVO getTimePrice(int snum) {
		return this.reservationMapper.getTimePrice(snum);
	}

	@Override
	public ReservationVO getCountPrice(int snum) {
		return this.reservationMapper.getCountPrice(snum);
	}

	@Override
	public ReservationVO getTotalPrice(int snum) {
		return this.reservationMapper.getTotalPrice(snum);
	}

	@Override
	public String userBookingTotalprice(String userid) {
		String u=this.reservationMapper.userBookingTotalprice(userid);
		if(u==null) {
			return "0";
		}
		return u;
	}

	@Override
	public List<mem_space_res_view> BookingView(String userid) {
		return this.reservationMapper.BookingView(userid);
	}

	@Override
	public ReservationVO getBooking(int rtnum) {
		return this.reservationMapper.getBooking(rtnum);
	}

	@Override
	public int insertFeedback(FeedbackVO fbvo) {
		return this.reservationMapper.insertFeedback(fbvo);
	}

	@Override
	public int updateUserPoint(FeedbackVO fbvo) {
		return this.reservationMapper.updateUserPoint(fbvo);
	}

	@Override
	public List<FeedbackVO> checkFeedback(String userid) {
		return this.reservationMapper.checkFeedback(userid);
	}

	@Override
	public List<ReasonVO> getReasonAll() {
		return this.reservationMapper.getReasonAll();
	}

	@Override
	public List<FeedbackVO> searchFeedbackByFilter(Map<String, String> filter) {
		return this.reservationMapper.searchFeedbackByFilter(filter);
	}

	@Override
	public List<ReservationVO> ReservationDateInfo(ReservationVO rvo) {
		return this.reservationMapper.ReservationDateInfo(rvo);
	}

	@Override
	public List<ReservationVO> CountbookingInfo(Schedule sch) {
		return this.reservationMapper.CountbookingInfo(sch);
	}

	@Override
	public int PlusSpacePoint(PointVO check) {
		return this.reservationMapper.PlusSpacePoint(check);
	}

	@Override
	public int MinusSpacePoint(PointVO check) {
		return this.reservationMapper.MinusSpacePoint(check);
	}

	@Override
	public List<ReservationVO> searchReservationByFilter(ReservationVO rvo) {
		return this.reservationMapper.searchReservationByFilter(rvo);
	}

	

}
