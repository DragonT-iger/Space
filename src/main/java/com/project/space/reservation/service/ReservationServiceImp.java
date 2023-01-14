package com.project.space.reservation.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.space.domain.ReservationVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.domain.mem_space_res_view;
import com.project.space.reservation.DelRes;
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
		int m=reservationMapper.updateUserRes(rtvo);
		if(m>0) {
			int n=reservationMapper.insertBooking(rtvo);
			return n;
		}else {
			return 0;
		}
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
	public int deleteBooking(DelRes dr) {
		int res=reservationMapper.deleteBooking(dr);
		if(res>0) {
			int n=reservationMapper.updateUserPoint(dr);
			return n;
		}else {
			return 0;
		}
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

	

}
