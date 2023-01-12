package com.project.space.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Space_Like {
	private int snum;
	private String sname;
	private String saddr1;
	private String simage1;
	private int hnum;
	private String userid;
	private Date hdate;
}
