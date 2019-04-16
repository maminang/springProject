package kr.ca.service;

import java.util.List;

import kr.ca.domain.ChargeHistoryDTO;
import kr.ca.domain.LoginDTO;
import kr.ca.domain.MemberDTO;

public interface MemberService {

	void insert(MemberDTO dto);

	MemberDTO mypage(LoginDTO login);

	LoginDTO login(LoginDTO dto);

	void update(MemberDTO mDto);

	int idcheck(String id);

	MemberDTO updateui(String id);

	void newPW(LoginDTO dto);
	
	void pointCharge(String id, int point);

	List<ChargeHistoryDTO> getChargeHistory(String id);

	MemberDTO selectMemberDTO(String id);

	void updatePW(String id, String pw);

	int getManager(String id);

	
}
