package com.project.space.admin.service;

import lombok.Data;

@Data
public class AdminGraphDataVO {
	private String msearchdate;
	private String rsearchdate;
	private String joincount;
	private String h_name;
	private String h_code;
	private String rescount;
	
	public String getRescount() {
		if(this.rescount==null) {
			return "0";
		}else
			return this.rescount;
	}
	public String getJoincount() {
		if(this.joincount==null) {
			return "0";
		}else
			return this.joincount;
	}
}
