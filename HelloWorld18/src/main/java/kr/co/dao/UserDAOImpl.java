package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.user";

	@Override
	public void updatePoint(UserVO vo) {
		session.update(NS + ".updatePoint", vo);
	}

	@Override
	public UserVO login(LoginDTO dto) {
		return session.selectOne(NS + ".login", dto);
	}

}
