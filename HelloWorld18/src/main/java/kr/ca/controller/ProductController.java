package kr.ca.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ca.domain.ProductDTO;
import kr.ca.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductService service;

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeUI() {
		return "board/write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(ProductDTO dto) {
		System.out.println(dto);
		service.write(dto);
		return "board/read";
	}

	@RequestMapping("/search")
	public String searchProduct(String keyword, Model model) {
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
