package kr.ca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ca.domain.ProductDTO;
import kr.ca.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductService service;

	@RequestMapping("/search")
	public String searchProduct(String keyword, Model model) {
		// 서비스 메서드부터 만들기 시작하면 됨 밥먹고 온 후의 나야
		List<ProductDTO> searchList = service.searchProduct(keyword);
		model.addAttribute("searchList", searchList);
		return "search";
	}

//	장바구니에 담기
	@RequestMapping("/insertShoppingCart")
	public String insertShoppingCart(String id, int pno, int amount) {

		System.out.println(amount);

		service.insertShoppingCart(id, pno, amount);

		return "board/read";
	}

//	테스트용임
	@RequestMapping("/read")
	public String readTest() {

		return "board/read";
	}

}
