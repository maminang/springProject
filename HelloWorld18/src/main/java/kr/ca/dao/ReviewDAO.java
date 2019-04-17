package kr.ca.dao;

import java.util.List;

import kr.ca.domain.ReviewDTO;

public interface ReviewDAO {

	void insert(ReviewDTO dto);

	List<ReviewDTO> getReviewList(int pno);

	void delete(int rno);

}
