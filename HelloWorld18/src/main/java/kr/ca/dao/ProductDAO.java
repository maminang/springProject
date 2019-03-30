package kr.ca.dao;

import java.util.List;

import kr.ca.domain.ProductDTO;
import kr.ca.domain.ShoppingCartDTO;

public interface ProductDAO {

	void write(ProductDTO dto);

	void addImages(String fullName, int pno);

	void insertShoppingCart(String id, int pno, int amount);

	List<ShoppingCartDTO> selectShoppingCart(String id);

	List<ProductDTO> searchProduct(String keyword);

	void getImages(List<ProductDTO> list);

	List<ProductDTO> getBestSellers();

	List<ProductDTO> getNewProducts();

}
