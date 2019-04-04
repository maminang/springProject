package kr.ca.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ca.dao.MemberDAO;
import kr.ca.domain.ChargeHistoryDTO;
import kr.ca.domain.LoginDTO;
import kr.ca.domain.MemberDTO;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Override
	public void insert(MemberDTO dto) {
		// TODO Auto-generated method stub
		dao.insert(dto);
	}
 
	@Override
	public MemberDTO mypage(LoginDTO login) {
		// TODO Auto-generated method stub
		
		return dao.mypage(login);
	}

	@Override
	public LoginDTO login(LoginDTO dto) {
		// TODO Auto-generated method stub
		
		return dao.login(dto);
	}

	@Override
	public MemberDTO updateui(String id) {
		// TODO Auto-generated method stub

		return dao.updateui(id);
	}

	@Override
	public void update(MemberDTO dto) {
		// TODO Auto-generated method stub
		dao.update(dto);
	}

	@Override
	public int idcheck(String id) {
		// TODO Auto-generated method stub
		return dao.idcheck(id);
	}

	@Override
	public void pointCharge(String id, int point) {
		// TODO Auto-generated method stub
		dao.pointCharge(id,point);
	}

	@Override
	public List<ChargeHistoryDTO> getChargeHistory(String id) {
		// TODO Auto-generated method stub
		return dao.getChargeHistory(id);
	}

}
