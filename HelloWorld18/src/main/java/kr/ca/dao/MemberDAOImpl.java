package kr.ca.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;
	private final String NS="kr.ca.mapper.member";
	
	
	@Override
	public void insert(MemberDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(dto+"DAOimpl");
		session.insert(NS+".insert", dto);
	}

}
