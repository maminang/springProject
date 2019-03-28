package kr.ca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import kr.ca.service.ProductService;

@RestController
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductService service;
	
//	장바구니에 담기
	@RequestMapping(value="/insertShoppingCart", method=RequestMethod.POST)
	public void insertShoppingCart(int pno, int bno) {
		
		service.insertShoppingCart(pno, bno);
		
	}
	
}
