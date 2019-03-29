package kr.ca.controller;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.ca.service.ShoppingCartService;

@Controller
@RequestMapping("product")
public class ShoppingCartController {

	@Autowired
	private ShoppingCartService service;
	
//	장바구니에 담기
	@RequestMapping("/insertShoppingCart")
	public String insertShoppingCart(String id, int pno, int amount) {
		
		System.out.println(amount);
		
		service.insertShoppingCart(id, pno,amount);
		
		return "board/read";
	}
	
//	테스트용임
	@RequestMapping("/read")
	public String readTest() {
		
		return "board/read";
	}
	
	
}
