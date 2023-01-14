package com.project.space.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.space.domain.PagingVO;
import com.project.space.domain.Qna_BoardVO;
import com.project.space.qna.mapper.QnaMapper;

@Service
public class QnaServiceImp implements QnaService {
	
	@Autowired
	private QnaMapper qnaMapper;

	@Override
	public int addQna(Qna_BoardVO qvo) {
		return this.qnaMapper.addQna(qvo);
	}

	@Override
	public int getQnaCount(PagingVO page) {
		return this.qnaMapper.getQnaCount(page);
	}
	
	@Override
	public List<Qna_BoardVO> listQnaPaging(PagingVO paging) {
		return this.qnaMapper.listQnaPaging(paging);
	}

	@Override
	public List<Qna_BoardVO> listQna(int snum) {
		return this.qnaMapper.listQna(snum);
	}

	@Override
	public Qna_BoardVO getQna(int qnum) {
		return this.qnaMapper.getQna(qnum);
	}

	@Override
	public int updateQna(Qna_BoardVO qvo) {
		return this.qnaMapper.updateQna(qvo);
	}

	@Override
	public int deleteQna(int qnum) {
		return this.qnaMapper.deleteQna(qnum);
	}

	@Override
	public int rewriteQna(Qna_BoardVO qvo) {
		Qna_BoardVO parent=this.selectGLG(qvo.getQnum());
		int n=this.updateGorder(parent);
		qvo.setQgroup(parent.getQgroup());
		qvo.setQlevel(parent.getQlevel());
		qvo.setQgorder(parent.getQgorder()+1);
		return this.qnaMapper.rewriteQna(qvo);
	}

	@Override
	public int updateGorder(Qna_BoardVO parent) {
		return this.qnaMapper.updateGorder(parent);
	}

	@Override
	public Qna_BoardVO selectGLG(int qnum) {
		return this.qnaMapper.selectGLG(qnum);
	}

	@Override
	public String checkTitle(int qnum) {
		return this.qnaMapper.checkTitle(qnum);
	}

	

}
