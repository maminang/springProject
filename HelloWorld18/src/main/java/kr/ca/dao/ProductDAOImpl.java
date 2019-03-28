package kr.ca.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.ProductDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession session;
	private final String NS = "kr.ca.mapper.product";

	public void insert(ProductDTO dto) {

		dto.setPno(getPno());
		session.insert(NS + ".insert", dto);
	}

	private int getPno() {
		Integer pno = session.selectOne(NS + ".getPno");
		if (pno != null)
			pno += 1;
		else
			pno = 1;

		return (int) pno;
	}
}
