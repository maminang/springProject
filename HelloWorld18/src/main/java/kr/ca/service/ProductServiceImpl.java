package kr.ca.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ca.dao.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO dao;
	
//	장바구니에 담기 insertShoppingCart
	@Override
	public void insertShoppingCart(String id, int pno, int amount) {
		
		dao.insertShoppingCart(id, pno, amount);
		
	}

}
