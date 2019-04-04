package kr.ca.service;

import java.util.List;
import kr.ca.domain.ShoppingCartDTO;

public interface ShoppingCartService {

//	장바구니에 담기
	void insertShoppingCart(ShoppingCartDTO dto);
//	장바구니 id로 select
	ShoppingCartDTO selectShoppingCart(ShoppingCartDTO dto);
//	장바구니 list
	List<ShoppingCartDTO>  listShoppingCart(ShoppingCartDTO dto);
//	장바구니 물건 delete
	void deleteShoppingCart(ShoppingCartDTO dto);
//	장바구니 물건 개수 update
	void updateShoppingCart(ShoppingCartDTO dto);

	
	
}
