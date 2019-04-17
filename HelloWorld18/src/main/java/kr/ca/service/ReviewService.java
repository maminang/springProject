package kr.ca.service;

import java.util.List;

import kr.ca.domain.ReviewDTO;

public interface ReviewService {

	void insert(ReviewDTO dto);

	List<ReviewDTO> getReviewList(int pno);

	void delete(int rno);

}
