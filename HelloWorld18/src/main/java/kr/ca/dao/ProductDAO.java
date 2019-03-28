package kr.ca.dao;

import kr.ca.domain.ProductDTO;

public interface ProductDAO {

	void insert(ProductDTO dto);

	void addImages(String fullName, int pno);

}
