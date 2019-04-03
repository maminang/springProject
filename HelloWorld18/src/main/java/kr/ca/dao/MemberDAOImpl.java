package kr.ca.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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


}
