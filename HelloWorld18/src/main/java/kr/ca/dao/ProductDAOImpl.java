package kr.ca.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession session;
	
	private final String NS = "kr.ca.mapper.product";
	
	@Override
	public void insertShoppingCart(int pno, int bno) {
		 
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("pno", pno);
		map.put("bno", bno);
		
		session.insert(NS+".insertShoppingCart", map);
		
	}

}
