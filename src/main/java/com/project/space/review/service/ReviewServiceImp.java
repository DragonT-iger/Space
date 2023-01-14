package com.project.space.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.space.domain.PagingVO;
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
		return 0;
	}

	@Override
	public int getReviewRtnum(int rtnum) {
		return this.reviewMapper.getReviewRtnum(rtnum);
	}

	@Override
	public List<ReviewVO> getReviewUserid(String userid) {
		return this.reviewMapper.getReviewUserid(userid);
	}

}
