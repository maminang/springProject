package kr.co.dao;

import java.util.List;

import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

public interface BoardDAO {
	List<BoardVO> list();

	BoardVO selectByBno(int bno);

	void insert(BoardVO vo);

	void update(BoardVO vo);

	void delete(int bno);

	BoardVO read(int bno);

	List<BoardVO> listPage(Criteria cri);

	int getAmount();

	List<BoardVO> search(SearchCriteria cri);

	int getSearchAmount(SearchCriteria cri);

	void incrViewCnt(int bno);
	
	void addAttach(String fullName, int bno);

	void deleteAttach(String fileName, int bno);

	void deleteAllAttach(int bno);
}
