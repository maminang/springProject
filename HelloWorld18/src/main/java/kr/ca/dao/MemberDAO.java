package kr.ca.dao;

import kr.ca.domain.LoginDTO;
import kr.ca.domain.MemberDTO;

public interface MemberDAO {

	void insert(MemberDTO dto);

	MemberDTO mypage(LoginDTO login);

	LoginDTO login(LoginDTO dto);

	MemberDTO updateui(String id);

	void update(MemberDTO dto);

	int idcheck(String id);

	
}
