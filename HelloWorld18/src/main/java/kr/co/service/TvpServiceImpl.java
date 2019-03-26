package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.TvpDAO;
import kr.co.domain.TvpDTO;

@Service
public class TvpServiceImpl implements TvpService {

	@Inject
	private TvpDAO dao;
	
	@Override
	public List<TvpDTO> list() {
		return dao.list();
	}

}
