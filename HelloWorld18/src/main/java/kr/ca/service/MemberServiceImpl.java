package kr.ca.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.ca.dao.MemberDAO;
import kr.ca.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;
	
	@Override
	public void insert(MemberDTO dto) {
		// TODO Auto-generated method stub
		
	}

}
