package kr.ca.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.ChargeHistoryDTO;
import kr.ca.domain.LoginDTO;
import kr.ca.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;
	private String NS="kr.ca.mapper.member";
	
	
	@Override
	public void insert(MemberDTO dto) {
		// TODO Auto-generated method stub
		session.insert(NS+".insert", dto);
	}

	@Override
	public MemberDTO mypage(LoginDTO login) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".mypage", login);
	}

	@Override
	public LoginDTO login(LoginDTO dto) {
		// TODO Auto-generated method stub
		
		return session.selectOne(NS+".login", dto);
	}

	@Override
	public MemberDTO updateui(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS + ".updateui", id);

	}

	@Override
	public void update(MemberDTO dto) {
		// TODO Auto-generated method stub
		
		session.update(NS+".update", dto);
	}

	@Override
	public int idcheck(String id) {
		return session.selectOne(NS+".idcheck", id);
	}

	@Override
	public void pointCharge(String id, int point) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("point", point);
		session.update(NS+".pointCharge", map);
		session.insert(NS+".chargeHistory", map);
	}

	@Override
	public List<ChargeHistoryDTO> getChargeHistory(String id) {
		return session.selectList(NS+".getChargeHistory", id);
	}


}
