package kr.ca.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.ProductDTO;

@Repository
public class ListDAOImple implements ListDAO{

	@Inject
	private SqlSession session;
	private final String NS="kr.ca.mapper.ListMapper";
	
	@Override
	public List<ProductDTO> citrusList() {
		
		return session.selectList(NS+".citrusList");
	}

}
