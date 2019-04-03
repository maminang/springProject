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

		Object oAmount = session.selectOne(NS + ".checkAmount", map);
		if (oAmount == null) {
			session.insert(NS + ".insertShoppingCartNull", map);
		} else {
			session.insert(NS + ".insertShoppingCart", map);
		}
	}

//	장바구니 id로 select
	@Override
	public ShoppingCartDTO selectShoppingCart(String id) {

		return session.selectOne(NS + ".selectShoppingCart", id);
	}

//	장바구니 list
	@Override
	public List<ShoppingCartDTO> listShoppingCart(ShoppingCartDTO dto) {

		return session.selectList(NS + ".listShoppingCart", dto);
	}

//	장바구니 물건 delete
	@Override
	public void deleteShoppingCart(ShoppingCartDTO dto) {

		session.delete(NS + ".deleteShoppingCart", dto);

	}

//	장바구니 물건 개수 update
	@Override
	public void updateShoppingCart(ShoppingCartDTO dto) {

		session.update(NS + ".updateShoppingCart", dto);

	}

	@Override
	public List<Integer> selectShoppingCartPno(String id) {

		return session.selectList(NS + ".selectShoppingCartPno", id);
	}

}
