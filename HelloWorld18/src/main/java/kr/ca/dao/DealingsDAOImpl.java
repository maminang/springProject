package kr.ca.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import kr.ca.domain.DealingsDTO;
import kr.ca.domain.ProductDTO;

public class DealingsDAOImpl implements DealingsDAO {
	@Inject
	private SqlSession session;
	private final String NS = "kr.ca.mapper.dealings";
	
	@Override
	public void insert(DealingsDTO dto) {
		session.insert(NS+".insert", dto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dno", dto.getDno());
		
		List<ProductDTO> products = dto.getDealings_products();
		for (ProductDTO product : products) {
			map.put("pno", product.getPno());
			map.put("amount", product.getAmount());
			session.insert(NS+".insertProducts", map);
		}
	}
}
