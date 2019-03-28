package kr.ca.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.ca.domain.ShoppingCartDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession session;
	
	private final String NS = "kr.ca.mapper.product";
	
//	장바구니에 담기
	@Override
	public void insertShoppingCart(String id, int pno, int amount) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("pno", pno);
		map.put("amount", amount);
		System.out.println("impl"+amount+"id"+id+"pno"+pno);
		System.out.println(map);
		
		Object oAmount = session.selectOne(NS+".checkAmount", map);
		if(oAmount == null) {
			session.insert(NS+".insertShoppingCartNull", map);
		} else {
			System.out.println(1111111111);
			System.out.println("impl"+amount);
			session.insert(NS+".insertShoppingCart", map);
		}
		
		
	}
//	장바구니 id로 select
	@Override
	public List<ShoppingCartDTO> selectShoppingCart(String id) {
		
		 
		return session.selectOne(NS+".selectShoppingCart", id); 
		
	}

}
