package kr.ca.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ca.domain.ProductDTO;
import kr.ca.service.ListService;

@Controller
public class ListController {
	
	@Inject
	private ListService service;
	
	@RequestMapping(value = "citrus", method = RequestMethod.GET)
	public String citrusList(Model model){
		List<ProductDTO> citrusList = service.citrusList();
		try {
			citrusList = service.citrusList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("citrusList",citrusList);
	return "board/list";
	}
}
