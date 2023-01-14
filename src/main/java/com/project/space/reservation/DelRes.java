package com.project.space.reservation;

import lombok.Data;

@Data
public class DelRes {
	private int rtnum; //예약번호
	private int totalprice; //환불금액
	private String userid;  //환불유저
}
