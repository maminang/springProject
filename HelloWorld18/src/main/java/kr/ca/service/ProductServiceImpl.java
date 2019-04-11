package kr.ca.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ca.dao.ProductDAO;
import kr.ca.domain.ProductDTO;
import kr.ca.domain.ProductDetailDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO dao;

	@Override
	public void write(ProductDTO dto, int[] volume, int[] price) {
		dao.write(dto, volume, price);
		String[] images = dto.getImages();
		dao.addImages(images, dto.getPno());
	}

	@Override
	public List<ProductDTO> getListByCategory(String category) {
		List<ProductDTO> list = dao.getListByCategory(category);
		dao.getImages(list);
		return list;
	}
	
	@Override
	public List<ProductDTO> searchProduct(String keyword) {
		List<ProductDTO> list = dao.searchProduct(keyword);
		dao.getImages(list);
		return list;
	}

	@Override
	public List<ProductDTO> getNewProducts() {
		List<ProductDTO> list = dao.getNewProducts();
		dao.getImages(list);
		return list;
	}

	@Override
	public ProductDTO selectProduct(int pno) {
		ProductDTO dto = dao.selectProduct(pno);
		dao.getImages(dto);
		return dto;
	}

	@Override
	public List<ProductDetailDTO> selectProductDetail(int pno) {
		return dao.selectProductDetail(pno);
	}

	

}
