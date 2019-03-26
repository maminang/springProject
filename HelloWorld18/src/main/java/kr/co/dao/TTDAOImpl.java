package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.TTDTO;

@Repository
public class TTDAOImpl implements TTDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NS = "kr.co.mapper.tt";
	
	@Override
	public void insert(TTDTO dto) {
		sqlSession.insert(NS+".insert", dto);
	}

	@Override
	public List<TTDTO> list() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NS+".list");
	}

}
