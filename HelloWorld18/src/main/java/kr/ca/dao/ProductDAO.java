package kr.ca.dao;

import java.util.List;

import kr.ca.domain.ProductDTO;
import kr.ca.domain.ShoppingCartDTO;

public interface ProductDAO {

	void insert(ProductDTO dto);

	void addImages(String fullName, int pno);

	void insertShoppingCart(String id, int pno, int amount);
	
	List<ShoppingCartDTO> selectShoppingCart(String id);

}
