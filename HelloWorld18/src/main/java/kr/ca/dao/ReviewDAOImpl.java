package kr.ca.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.ReviewDTO;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Inject
	private SqlSession session;
	private final String NS = "kr.ca.mapper.review";

	@Override
	public void insert(ReviewDTO dto) {
		Integer rno = crtRno();
		dto.setRno(rno);
		session.insert(NS + ".insert", dto);
	}

	private int crtRno() {
		Integer rno = session.selectOne(NS + ".crtRno");
		if (rno == null) {
			rno = 1;
		} else {
			rno++;
		}
		return rno;
	}

	@Override
	public List<ReviewDTO> getReviewList(int pno) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".getReviewList", pno);
	}

	@Override
	public void delete(int rno) {
		// TODO Auto-generated method stub
		session.delete(NS+".delete", rno);
	}

}
