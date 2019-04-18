package kr.ca.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ca.domain.ProductDTO;
import kr.ca.service.ProductService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	private ProductService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		List<ProductDTO> list = service.allProduct();
		model.addAttribute("list", list);
		return "main";
	}

	@RequestMapping("about")
	public void about() {
	}
}
