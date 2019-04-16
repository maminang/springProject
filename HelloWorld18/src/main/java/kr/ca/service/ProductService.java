package kr.ca.service;

import java.util.List;

import kr.ca.domain.ProductDTO;
import kr.ca.domain.ProductDetailDTO;

public interface ProductService {

	List<ProductDTO> searchProduct(String keyword);

	void write(ProductDTO dto, int[] volume, int[] price);

	List<ProductDTO> getNewProducts();

	List<ProductDTO> getListByCategory(String category);

	ProductDTO selectProduct(int pno);

	List<ProductDetailDTO> selectProductDetail(int pno);

	List<ProductDTO> getBestSellers();

	List<ProductDTO> allProduct();

}
