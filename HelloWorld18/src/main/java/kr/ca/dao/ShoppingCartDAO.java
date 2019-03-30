package kr.ca.dao;

import java.util.List; 
import kr.ca.domain.ShoppingCartDTO;

public interface ShoppingCartDAO {

//	장바구니에 담기
	void insertShoppingCart(ShoppingCartDTO dto);
//	장바구니 id로 select
	List<ShoppingCartDTO> selectShoppingCart(String id);

	
	
}
