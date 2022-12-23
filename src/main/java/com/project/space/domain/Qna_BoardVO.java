package com.project.space.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Qna_BoardVO {
	private int qnum;  //문의글번호
	private String userid; //회원아이디 (mem_info)
	private int snum; //공간번호 fk
	private String qpwd;  //글비밀번호
	private String qtitle;  //글제목
	private String qcontent;  //글내용
	private Date qdate;  //작성일
	
	private int qgroup;  //글 그룹
	private int qlevel; //답변레벨
	private int qgorder;  //같은 그룹내의 순서
}
