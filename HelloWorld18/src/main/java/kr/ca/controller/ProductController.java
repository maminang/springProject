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
		return "product/write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(ProductDTO dto, String[] images) {
		System.out.println(dto);
		System.out.println(images);
		service.write(dto);
		return "product/read";
	}

	@RequestMapping("search")
	public String searchProduct(String keyword, Model model) {
		List<ProductDTO> searchList = service.searchProduct(keyword);
		model.addAttribute("searchList", searchList);
		return "product/search";
	}

	@RequestMapping("newProduct")
	public String newProduct(Model model) {
		model.addAttribute("newProducts", service.getNewProducts());
		return "product/newproduct";
	}

}
