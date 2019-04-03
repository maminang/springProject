package kr.ca.dao;

import java.util.List;

import kr.ca.domain.ProductDTO;
import kr.ca.domain.ProductDetailDTO;

public interface ProductDAO {

	void insert(ProductDTO dto);

	void addImages(String fullName, int pno);

	ProductDTO selectProduct(ProductDTO dto);
	
	List<ProductDetailDTO> selectProductDetail(int pno);

	ProductDetailDTO selectOneProductDetail(int pno, int volume);

	int selectCountProductDetail();



}
