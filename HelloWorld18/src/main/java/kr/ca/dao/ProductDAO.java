package kr.ca.dao;

import java.util.List;

import kr.ca.domain.ProductDTO;
import kr.ca.domain.ProductDetailDTO;

public interface ProductDAO {

	void write(ProductDTO dto, int[] volume, int[] price);

	void addImages(String[] images, int pno);

	List<ProductDTO> searchProduct(String keyword);

	void getImages(ProductDTO dto);
	
	void getImages(List<ProductDTO> list);

	List<ProductDTO> getBestSellers();

	List<ProductDTO> getNewProducts();

	List<ProductDTO> getListByCategory(String category);

	ProductDTO selectProduct(int pno);
	
	ProductDTO selectProduct(ProductDTO dto);

	List<ProductDetailDTO> selectProductDetail(int pno);

	int selectCountProductDetail();

	ProductDetailDTO selectOneProductDetail(int pno, int i);

	List<ProductDTO> allProduct();

}
