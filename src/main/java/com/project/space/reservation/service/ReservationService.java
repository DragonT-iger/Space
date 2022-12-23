package com.project.space.reservation.service;

import java.util.List;

import com.project.space.domain.ReservationVO;

public interface ReservationService {

	//예약달력에 보여줄 공간번호로 예약 내역 가져오기(달력에 예약가능,불가능)
	List<ReservationVO> bookingInfo(int snum);
	
	//일반유저가 본인의 예약내역 열람
	List<ReservationVO> userBookingInfo(String userid);
	//일반유저가 예약신청
	int insertBooking(ReservationVO rtvo);
	//일반유저가 본인의 예약 내역을 변경
	int updateBooking(int snum);
	//일반유저가 본인의 예약 내용을 취소
	int deleteBooking(int snum);
	
	//홈화면에서 예약 일자,시간 검색 시 예약상태(가능)에 따른 예약가능 공간(뷰생성)
	List<ReservationVO> searchBookingInfo(int rtstatus);
	
	
	
	
}
