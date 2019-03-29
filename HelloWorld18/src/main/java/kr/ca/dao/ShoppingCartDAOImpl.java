package kr.ca.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kr.ca.domain.ShoppingCartDTO;

@Repository
public class ShoppingCartDAOImpl implements ShoppingCartDAO {

	@Autowired
	private SqlSession session;
	
	private final String NS = "kr.ca.mapper.shoppingCart";
	
//	장바구니에 담기
	@Override
	public void insertShoppingCart(ShoppingCartDTO dto) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", dto.getId());
		map.put("pno", dto.getPno());
		map.put("amount", dto.getAmount());
//		System.out.println(map);
		
		Object oAmount = session.selectOne(NS+".checkAmount", map);
		if(oAmount == null) {
			session.insert(NS+".insertShoppingCartNull", map);
		} else {
//			System.out.println(1111111111);
			session.insert(NS+".insertShoppingCart", map);
		}
		
		
	}
//	장바구니 id로 select
	@Override
	public List<ShoppingCartDTO> selectShoppingCart(String id) {
		
		 
		return session.selectOne(NS+".selectShoppingCart", id); 
		
	}

}
