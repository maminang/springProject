package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.TTDAO;
import kr.co.domain.TTDTO;

@Service
public class TTServiceImpl implements TTService {

	@Autowired
	private TTDAO dao;
	
	@Override
	public void insert(TTDTO dto) {
		dao.insert(dto);
	}

	@Override
	public List<TTDTO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

}
