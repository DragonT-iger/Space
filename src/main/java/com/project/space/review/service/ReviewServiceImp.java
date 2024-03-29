package com.project.space.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.space.domain.PagingVO;
import com.project.space.domain.Qna_BoardVO;
import com.project.space.domain.ReviewVO;
import com.project.space.review.mapper.ReviewMapper;

@Service
public class ReviewServiceImp implements ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public int addReview(ReviewVO rvo) {
		return this.reviewMapper.addReview(rvo);
	}

	@Override
	public List<ReviewVO> listReview(int snum) {
		return null;
	}

	@Override
	public int getReviewCount(int snum) {
		return this.reviewMapper.getReviewCount(snum);
	}

	@Override
	public ReviewVO getReview(int review_num) {
		return this.reviewMapper.getReview(review_num);
	}

	@Override
	public int updateReview(ReviewVO rvo) {
		return this.reviewMapper.updateReview(rvo);
	}

	@Override
	public int deleteReview(int review_num) {
		return this.reviewMapper.deleteReview(review_num);
	}

	@Override
	public List<ReviewVO> listReviewPaging(PagingVO paging) {
		return this.reviewMapper.listReviewPaging(paging);
	}

	@Override
	public int getReviewCountPaging(PagingVO paging) {
		return this.reviewMapper.getReviewCountPaging(paging);
	}

	@Override
	public int rewriteReview(ReviewVO rvo) {
		ReviewVO parent=this.rselectGLG(rvo.getReview_num());
		int n=this.rupdateGorder(parent);
		rvo.setRgroup(parent.getRgroup());
		rvo.setRlevel(parent.getRlevel());
		rvo.setRgorder(parent.getRgorder()+1);
		return this.reviewMapper.rewriteReview(rvo);
	}
	
	@Override
	public int rupdateGorder(ReviewVO parent) {
		return this.reviewMapper.rupdateGorder(parent);
	}

	@Override
	public ReviewVO rselectGLG(int rnum) {
		return this.reviewMapper.rselectGLG(rnum);
	}

	@Override
	public int getReviewRtnum(int rtnum) {
		return this.reviewMapper.getReviewRtnum(rtnum);
	}

	@Override
	public List<ReviewVO> getReviewUserid(String userid) {
		return this.reviewMapper.getReviewUserid(userid);
	}

	@Override
	public ReviewVO checkTitle(int qnum) {
		return this.reviewMapper.checkTitle(qnum);
	}

}
