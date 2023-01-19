package com.project.space.review.mapper;

import java.util.List;

import com.project.space.domain.ReviewVO;

public interface ReviewMapper {
	public int addReview(ReviewVO rvo);    //리뷰 등록

	public List<ReviewVO> listReview(int snum);  //특정 상품에 대한 리뷰 목록

	public int getReviewCount(int snum);  //리뷰 개수

	public ReviewVO getReview(int review_num);    //리뷰 번호로 리뷰내용 가져오기

	public int updateReview(ReviewVO rvo);     //리뷰 수정

	public int deleteReview(int review_num);     //리뷰 삭제
}
