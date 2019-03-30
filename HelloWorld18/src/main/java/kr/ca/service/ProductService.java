package kr.ca.service;

import java.util.List;

import kr.ca.domain.MemberDTO;
import kr.ca.domain.ProductDTO;
import kr.ca.domain.ShoppingCartDTO;

public interface ProductService {

	List<ProductDTO> searchProduct(String keyword);

	void write(ProductDTO dto);

}
