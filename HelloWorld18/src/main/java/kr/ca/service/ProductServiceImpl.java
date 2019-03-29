package kr.ca.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ca.dao.ProductDAO;
import kr.ca.domain.ProductDTO;
import kr.ca.domain.ShoppingCartDTO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO dao;

	@Override
	public void write(ProductDTO dto) {
		dao.write(dto);
	}

//	장바구니에 담기 insertShoppingCart
	@Override
	public void insertShoppingCart(String id, int pno, int amount) {
		dao.insertShoppingCart(id, pno, amount);
	}

//	장바구니 id로 select
	@Override
	public List<ShoppingCartDTO> selectShoppingCart(String id) {
		return dao.selectShoppingCart(id);
	}

	@Override
	public List<ProductDTO> searchProduct(String keyword) {
		List<ProductDTO> list = dao.searchProduct(keyword);
		dao.getImages(list);
		return list;
	}

}
