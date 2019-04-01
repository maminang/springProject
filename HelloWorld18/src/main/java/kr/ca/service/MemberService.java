package kr.ca.service;

import kr.ca.domain.LoginDTO;
import kr.ca.domain.MemberDTO;

public interface MemberService {

	void insert(MemberDTO dto);

	MemberDTO mypage(LoginDTO login);

	LoginDTO login(LoginDTO dto);
	
}
