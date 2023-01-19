package com.project.space.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Heart_LikeVO {
	private int hnum; 
	private int snum;
	private String userid;
	private Date hdate;
}
