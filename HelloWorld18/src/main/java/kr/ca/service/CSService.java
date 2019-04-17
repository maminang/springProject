package kr.ca.service;

import java.util.List;

import kr.ca.domain.CSDTO;
import kr.ca.domain.Criteria;
import kr.ca.domain.SearchCriteria;

public interface CSService {
	// 리스트
	List<CSDTO> csList();

	int getAmount();

	List<CSDTO> listPage(Criteria cri);

	// 글쓰기
	void insert(CSDTO vo);
	
	//답글 작성
	
	
	// 자세히 보기
	CSDTO read(int bno);

	// 글 수정
	CSDTO updateUI(int bno);

	void update(CSDTO vo);

	// 글 삭제
	void delete(int bno);

	// 검색
	List<CSDTO> search(SearchCriteria cri);

	int getSearchAmount(SearchCriteria cri);

	void delete(CSDTO vo);

	

	

	CSDTO answerui(int bno);

	void answer(CSDTO vo);

	CSDTO deleteui(int bno);

}
