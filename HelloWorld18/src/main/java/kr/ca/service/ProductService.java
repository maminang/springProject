package kr.ca.service;

import java.util.List;

import kr.ca.domain.ProductDTO;

public interface ProductService {

	List<ProductDTO> searchProduct(String keyword);

	void write(ProductDTO dto);

	List<ProductDTO> getNewProducts();

}
