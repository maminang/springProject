package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.domain.TTDTO;
import kr.co.service.TTService;

@Controller
@RequestMapping("/tt")
public class TTController {

	@Inject
	private TTService service;

	@RequestMapping("/insert")
	public String insert(TTDTO dto, Model model) {
		service.insert(dto);
		model.addAttribute("msg", "is it alive?");
		return "redirect:/list";
	}
	
	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("list", 	service.list());
		return "list";
	}
}
