package kr.ca.dao;

import java.util.List;

import kr.ca.domain.CSDTO;
import kr.ca.domain.Criteria;

public interface CSDAO {
	List<CSDTO> csList();

	List<CSDTO> listPage(Criteria cri);
	
	int getAmount();
	
	
	void insert(CSDTO cdto);
	
	/* void addAttach(String fileName, int idbno); */
}
