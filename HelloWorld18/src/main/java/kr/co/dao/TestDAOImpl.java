package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import kr.co.domain.TestDTO;

@Repository
public class TestDAOImpl implements TestDAO {
	@Inject
	private SqlSession sqlSession;
	private final String NS = "kr.co.mapper.test";

	@Override
	public void insert(TestDTO dto, Model model) {
		sqlSession.insert(NS + ".insert", dto);
	}

	@Override
	public List<TestDTO> list() {
		return sqlSession.selectList(NS + ".list");
	}

	@Override
	public void write(TestDTO dto) {
		sqlSession.insert(NS + ".insert", dto);
	}

	@Override
	public TestDTO read(int num) {
		return sqlSession.selectOne(NS + ".read", num);
	}

	@Override
	public void update(TestDTO dto) {
		sqlSession.update(NS + ".update", dto);
	}

	@Override
	public void delete(int num) {
		sqlSession.delete(NS + ".delete", num);
	}

}
