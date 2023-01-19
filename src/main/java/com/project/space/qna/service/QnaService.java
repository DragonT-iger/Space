package com.project.space.qna.service;

import java.util.List;

import com.project.space.domain.Qna_BoardVO;

public interface QnaService {
	public int addQna(Qna_BoardVO qvo);    //등록

	public List<Qna_BoardVO> listQna(int snum);  

	public int getQnaCount(int snum);  // 개수

	public Qna_BoardVO getQna(int qnum);    //번호로 리뷰내용 가져오기

	public int updateQna(Qna_BoardVO qvo);     // 수정

	public int deleteQna(int qnum);     // 삭제
}
