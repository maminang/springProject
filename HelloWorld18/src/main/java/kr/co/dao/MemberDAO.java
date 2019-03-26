package kr.co.dao;

import java.util.List;

import kr.co.domain.MemberDTO;

public interface MemberDAO {
	void insert(MemberDTO dto);

	List<MemberDTO> select();

	MemberDTO selectById(int id);

	MemberDTO updateui(int id);

	void update(MemberDTO dto);

	void delete(int id);
}
