package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.TvpDTO;

@Repository
public class TvpDAOImpl implements TvpDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NS = "kr.co.mapper.tvp";

	@Override
	public List<TvpDTO> list() {
		return sqlSession.selectList(NS + ".list");
	}

}
