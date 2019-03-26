package kr.co.dao;

import java.util.List;

import kr.co.domain.TTDTO;

public interface TTDAO {

	public void insert(TTDTO dto);

	public List<TTDTO> list();
	
}
