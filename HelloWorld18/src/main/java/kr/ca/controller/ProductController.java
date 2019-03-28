package kr.ca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ca.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductService service;
	
//	장바구니에 담기
	@RequestMapping(value="/insertShoppingCart", method= {RequestMethod.GET, RequestMethod.POST})
	public void insertShoppingCart(String id, int pno) {
		System.out.println("11111111111");
		System.out.println(id+pno);
		service.insertShoppingCart(id, pno);
	}
	
//	테스트용임
	@RequestMapping("/readTest")
	public String readTest() {
		
		return "board/readTest";
	}
	
	
}
