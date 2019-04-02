package kr.ca.dao;

import java.util.List;

import kr.ca.domain.ProductDTO;

public interface ProductDAO {

	void write(ProductDTO dto);

	void addImages(String[] images, int pno);

	List<ProductDTO> searchProduct(String keyword);

	void getImages(List<ProductDTO> list);

	List<ProductDTO> getBestSellers();

	List<ProductDTO> getNewProducts();

	List<ProductDTO> getListByCategory(String category);
}
