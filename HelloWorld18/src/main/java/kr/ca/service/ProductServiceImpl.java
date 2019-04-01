package kr.ca.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ca.dao.ProductDAO;
import kr.ca.domain.ProductDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO dao;

	@Override
	public void write(ProductDTO dto) {
		dao.write(dto);
		String[] images = dto.getImages();
		dao.addImages(images, dto.getPno());
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

}
