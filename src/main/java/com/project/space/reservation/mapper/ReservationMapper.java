package com.project.space.reservation.mapper;

import java.util.List;

import com.project.space.domain.ReservationVO;
import com.project.space.domain.Space_InfoVO;
import com.project.space.reservation.Schedule;

public interface ReservationMapper {
	//예약 번호 들고오기
	Integer selectBookingBySnum(ReservationVO rtvo);

	//예약달력에 보여줄 공간번호로 예약 내역 가져오기(달력에 예약가능,불가능)
	List<ReservationVO> bookingInfo(int snum);
	List<ReservationVO> CalbookingInfo(Schedule sch);
	//예약 시작날짜별로 예약 내역 가져오기
	List<ReservationVO> bookingTimeInfo(String rtstartdate);
	//일반유저가 본인의 예약내역 열람
	List<ReservationVO> userBookingInfo(String userid);
	
	//공간번호로 특정 공간 정보 가져오기
	public Space_InfoVO selectBySnum(int snum);
	
	//일반유저가 예약신청
	int insertBooking(ReservationVO rtvo);
	int updateUserRes(ReservationVO rtvo);  //예약할때 포인트 빠져나가기
	
	//예약 추가 관련=> 기존에 담긴 상품이면 인원만 수정하기
	int updateBooking(ReservationVO rtvo); 
	//일반유저가 본인의 예약 내역을 변경
	int updateBookingEdit(int snum);
	//일반유저가 본인의 예약 내용을 취소
	int deleteBooking(int snum);
	//예약 전체 취소
	
	//홈화면에서 예약 일자,시간 검색 시 예약상태(가능)에 따른 예약가능 공간(뷰생성)
	List<ReservationVO> searchBookingInfo(int rtstatus);
	
	/**예약금액 관련 메소드===============*/	
	ReservationVO getTimePrice(int snum); //특정 공간의 시간별 금액 구하기
	ReservationVO getCountPrice(int snum); //특정 공간의 인원 추가 금액 구하기
	ReservationVO getTotalPrice(int snum); //특정 공간의 총액
	
	
	
	
}
