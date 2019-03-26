package kr.co.service;

import java.util.List;

import kr.co.domain.Criteria;
import kr.co.domain.ReplyVO;

public interface ReplyService {
	void insert(ReplyVO vo);

	List<ReplyVO> list(int bno, Criteria cri);

	void update(ReplyVO vo);
	
	void delete(int rno);

	int getAmount(int bno);

	Boolean checkID(String inputID);
}
