package com.project.space.review.service;

import java.util.List;

import com.project.space.domain.PagingVO;
import com.project.space.domain.ReviewVO;

public interface ReviewService {
	public int addReview(ReviewVO rvo);    //리뷰 등록

	public List<ReviewVO> listReview(int snum);  //특정 상품에 대한 리뷰 목록
	public List<ReviewVO> listReviewPaging(PagingVO paging);
	
	public int getReviewCount(int snum);
	public int getReviewCountPaging(PagingVO paging);  //리뷰 개수

	public ReviewVO getReview(int review_num);    //리뷰 번호로 리뷰내용 가져오기

	public int updateReview(ReviewVO rvo);     //리뷰 수정

	public int deleteReview(int review_num);     //리뷰 삭제
	
	public int rewriteReview(ReviewVO rvo);  //답변

	public int getReviewRtnum(int rtnum); //예약번호로 이미 남긴 리뷰 있는지 없는지 확인

	public List<ReviewVO> getReviewUserid(String userid); //아이디로 리뷰내역 불러오기
	
	public ReviewVO checkTitle(int qnum);

	ReviewVO rselectGLG(int rnum);

	int rupdateGorder(ReviewVO parent);
}
