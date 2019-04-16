package kr.ca.service;

import java.util.List;

import kr.ca.domain.ReplyVO;

public interface ReplyService {
	void insert(ReplyVO vo);
	
	List<ReplyVO> list(int bno);
	
	void update(ReplyVO vo);
	
	void delete(int rno);
	
	int getAmount(int bno);
	
	List<ReplyVO> list(int bno, int page);
}
