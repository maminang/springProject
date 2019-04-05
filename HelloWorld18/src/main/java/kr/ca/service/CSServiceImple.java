package kr.ca.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ca.dao.CSDAO;
import kr.ca.domain.CSDTO;
import kr.ca.domain.Criteria;

@Service
@Transactional
public class CSServiceImple implements CSService{
	@Inject
	private CSDAO cdao;
	
	public List<CSDTO> csList(){
		
		return cdao.csList();
	}

	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return cdao.getAmount();
	}

	@Override
	public List<CSDTO> listPage(Criteria cri) {
		// TODO Auto-generated method stub
				
		return cdao.listPage(cri);
	}

	

	@Override
	public void insert(CSDTO cdto) {
		// TODO Auto-generated method stub
		cdao.insert(cdto);
		String[] files=cdto.getQfile();
		/*
		 * if(files==null) { return; } for(int i=0;i<files.length;i++) {
		 * cdao.addAttach(files[i],cdto.getIdnbr()); }
		 */
	}

	
}
