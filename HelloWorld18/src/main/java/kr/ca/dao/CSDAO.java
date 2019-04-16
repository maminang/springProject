package kr.ca.dao;

import java.util.List;

import kr.ca.domain.CSDTO;
import kr.ca.domain.Criteria;
import kr.ca.domain.SearchCriteria;

public interface CSDAO {
	//리스트
	List<CSDTO> list();

	List<CSDTO> listPage(Criteria cri);
	
	int getAmount();
	
	//글쓰기
	void insert(CSDTO vo);
	
	//글읽기
	CSDTO read(int bno);

	//수정
	
	
	CSDTO updateUI(int bno);

	void update(CSDTO vo);
	
	//삭제
	void delete(CSDTO vo);

	//검색
	List<CSDTO> search(SearchCriteria cri);

	int getSearchAmount(SearchCriteria cri);

	
	//댓글 삭제
	void delete(int bno);

	//조회수
	//void updateViewCnt(int bno);
	
	//void incrViewCnt(int bno);
	
	//첨부파일
	void addAttach(String fullName, int bno);

	//첨부파일 삭제
	void deleteAttach(String fileName, int bno);

	void deleteAllAttach(int bno);

	CSDTO answerui(int bno);

	void answer(CSDTO vo);

	CSDTO deleteui(int bno);

	

	
}
