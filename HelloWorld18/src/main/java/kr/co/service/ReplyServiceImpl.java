package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.ReplyDAO;
import kr.co.domain.Criteria;
import kr.co.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;

	@Override
	public void insert(ReplyVO vo) {
		dao.insert(vo);
	}

	@Override
	public List<ReplyVO> list(int bno, Criteria cri) {
		return dao.list(bno, cri);
	}

	@Override
	public void update(ReplyVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int rno) {
		dao.delete(rno);
	}

	@Override
	public int getAmount(int bno) {
		return dao.getAmount(bno);
	}

	@Override
	public Boolean checkID(String inputID) {
		return dao.checkID(inputID);
	}

}
