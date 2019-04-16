package kr.ca.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ca.dao.ReplyDAO;
import kr.ca.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Inject
	private ReplyDAO dao;
	
	

	@Override
	public void insert(ReplyVO vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
	}

	@Override
	public List<ReplyVO> list(int bno) {
		// TODO Auto-generated method stub
		return dao.list(bno);
	}

	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(int rno) {
		// TODO Auto-generated method stub
		dao.delete(rno);
	}
	
	@Override
	public int getAmount(int bno) {
		// TODO Auto-generated method stub
		return dao.getAmount(bno);
	}

	@Override
	public List<ReplyVO> list(int bno, int page) {
		// TODO Auto-generated method stub
		return dao.list(bno, page);
	}
}
