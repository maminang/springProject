package kr.ca.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ca.dao.ReviewDAO;
import kr.ca.domain.ReviewDTO;

@Service
@Transactional
public class ReviewServiceImpl implements ReviewService {

	@Inject
	private ReviewDAO dao;

	@Override
	public void insert(ReviewDTO dto) {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}

	@Override
	public List<ReviewDTO> getReviewList(int pno) {
		// TODO Auto-generated method stub
		return dao.getReviewList(pno);
	}

	@Override
	public void delete(int rno) {
		// TODO Auto-generated method stub
		dao.delete(rno);
	}

}