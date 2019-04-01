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
		System.out.println("서비스까지 정상 도착");
		
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
		System.out.println("2. csserviceimpl -> csdaoimple listpage(cri)");
		
		return cdao.listPage(cri);
	}

	
}
