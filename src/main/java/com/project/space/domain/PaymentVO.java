package com.project.space.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private int paynum;
	private int rtnum;
	private String userid;
	private int snum;
	private String paykind;
	private Date paydate;
	private int paystatus;
}
