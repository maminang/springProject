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
	public void insertShoppingCart(String id, int pno, int amount) {
		 
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("pno", pno);
		map.put("amount", amount);
		System.out.println(map);
		session.insert(NS+".insertShoppingCart", map);
		
	}

}
