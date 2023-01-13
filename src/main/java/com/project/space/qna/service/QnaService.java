package com.project.space.qna.service;

import java.util.List;

import com.project.space.domain.PagingVO;
import com.project.space.domain.Qna_BoardVO;

public interface QnaService {
	public int addQna(Qna_BoardVO qvo);    //등록

	public List<Qna_BoardVO> listQna(int snum);  
	public List<Qna_BoardVO> listQnaPaging(PagingVO paging);
	
	public int getQnaCount(PagingVO page);  // 개수

	public Qna_BoardVO getQna(int qnum);    //번호로 리뷰내용 가져오기

	public int updateQna(Qna_BoardVO qvo);     // 수정

	public int deleteQna(int qnum);     // 삭제
	
	public int rewriteQna(Qna_BoardVO qvo);  //답변

	public int updateGorder(Qna_BoardVO parent);

	public Qna_BoardVO selectGLG(int qnum);

	public String checkTitle(int qnum);
}
