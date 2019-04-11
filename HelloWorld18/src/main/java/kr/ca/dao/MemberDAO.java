package kr.ca.dao;

import java.util.List;

import kr.ca.domain.ChargeHistoryDTO;
import kr.ca.domain.LoginDTO;
import kr.ca.domain.MemberDTO;

public interface MemberDAO {

	void insert(MemberDTO dto);

	MemberDTO mypage(LoginDTO login);

	LoginDTO login(LoginDTO dto);

	MemberDTO updateui(String id);

	void update(MemberDTO dto);

	int idcheck(String id);

	void newPW(LoginDTO dto);

	MemberDTO selectMemberDTO(String id);
	
	void pointCharge(String id, int point);

	List<ChargeHistoryDTO> getChargeHistory(String id);

	void updatePW(String id, String pw);



	
}
