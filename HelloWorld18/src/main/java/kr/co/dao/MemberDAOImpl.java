package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NS = "kr.co.mapper.member";

	@Override
	public void insert(MemberDTO dto) {
		sqlSession.insert(NS + ".insert", dto);
	}

	@Override
	public List<MemberDTO> select() {
		return sqlSession.selectList(NS + ".select");
	}

	@Override
	public MemberDTO selectById(int id) {
		return sqlSession.selectOne(NS + ".selectById", id);
	}

	@Override
	public MemberDTO updateui(int id) {
		return sqlSession.selectOne(NS + ".updateui", id);
	}

	@Override
	public void update(MemberDTO dto) {
		sqlSession.update(NS + ".update", dto);
	}

	@Override
	public void delete(int id) {
		sqlSession.delete(NS + ".delete", id);
	}

}
