package kr.ca.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.FooterInfoDTO;
import kr.ca.domain.MenuDTO;

@Repository
public class MainDAOImpl implements MainDAO {
	
	@Inject
	private SqlSession session;
	private final String NS = "kr.ca.mapper.main";

	@Override
	public List<MenuDTO> getMenu() {
		return session.selectList(NS+".getMenu");
	}

	@Override
	public FooterInfoDTO getFooterInfo() {
		return session.selectOne(NS+".getFooterInfo");
	}

}
