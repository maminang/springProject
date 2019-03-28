package kr.ca.dao;

import java.util.List;

import kr.ca.domain.MemberDTO;
import kr.ca.domain.ShoppingCartDTO;

public interface ProductDAO {

//	장바구니에 담기
	void insertShoppingCart(String id, int pno, int amount);
//	장바구니 id로 select
	List<ShoppingCartDTO> selectShoppingCart(String id);

	
	
}
