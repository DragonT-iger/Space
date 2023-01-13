package com.project.space.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PointVO {  //포인트 충전
	private int paynum;  //충전번호
	private String userid; //회원아이디
	private int plusPoint; //충전된 포인트
	private String paykind; //충전 경로
	private Date paydate;  //충전한 날짜
	private int paystatus;  //충전상태
	//근데 여기는 회원아이디로 회원정보를 불러올수있지만
	//회원정보에는 이걸 불러올수 있는 키가 없잖아요
	//여기에만 fk가 있으면 자동연동이 되나요? 역으로 부르는게 가능한가요
	//맞네요 따로 회원정보에 넣을 필요가 없네요 
	//그래도 이 테이블은 하나 있어야하지않을까요 이게 기록이 저장되야하는거니까
	//이거까지 해서 내일 다른 분들이랑 같이 얘기하고
	//소연님이랑 내용 공유하시고 전체적으로 정비해서 다시 진행해봅시다
	//고생하셨어요 내일뵐게요
}
