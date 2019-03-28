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
	public void insertShoppingCart(int pno, int bno) {
		
		dao.insertShoppingCart(pno, bno);
		
	}

}
