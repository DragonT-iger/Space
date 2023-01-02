package com.project.space.reservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.space.domain.ReservationVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.reservation.Schedule;
import com.project.space.reservation.mapper.ReservationMapper;
import com.project.space.spaceinfo.mapper.SpaceInfoMapper;

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
		Integer cnt=reservationMapper.selectBookingBySnum(rtvo);
		if(cnt!=null) {
			int n=reservationMapper.updateBooking(rtvo);
			return n;
		}else {
			int n=reservationMapper.insertBooking(rtvo);
			return n;
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
	public int deleteBooking(int snum) {
		// TODO Auto-generated method stub
		return 0;
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

	

}
