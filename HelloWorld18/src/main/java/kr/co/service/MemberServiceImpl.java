package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.MemberDAO;
import kr.co.domain.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	@Override
	public void insert(MemberDTO dto) {
		dao.insert(dto);
	}

	@Override
	public List<MemberDTO> select() {
		return dao.select();
	}

	@Override
	public MemberDTO selectById(int id) {
		return dao.selectById(id);
	}

	@Override
	public MemberDTO updateui(int id) {
		return dao.updateui(id);
	}

	@Override
	public void update(MemberDTO dto) {
		dao.update(dto);
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

}
