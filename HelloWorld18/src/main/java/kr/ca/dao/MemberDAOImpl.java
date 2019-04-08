package kr.ca.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.LoginDTO;
import kr.ca.domain.MemberDTO;
import kr.ca.utils.Email;

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
		// TODO Auto-generated method stub
		return session.selectOne(NS+".idcheck", id);
	}

	@Override
	public void newPW(LoginDTO dto) {
		// TODO Auto-generated method stub
		String pw=dto.getPw();
		dto.setPw(pw);
		
		session.update(NS+".newPW", dto);
	}

	@Override
	public MemberDTO selectMemberDTO(String id) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".selectMemberDTO", id);
	}

	
	
	
}
