package kr.ca.service;

import java.util.List;


import kr.ca.domain.CSDTO;
import kr.ca.domain.Criteria;

public interface CSService {

	List<CSDTO> csList();

	int getAmount();

	List<CSDTO> listPage(Criteria cri);
	
	
	
	
	// insert values into faq_tbl (it needs faq_tbl index number)
	void insert(CSDTO cdto);
}
