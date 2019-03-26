package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.service.TvpService;

@Controller
@RequestMapping("/tvp")
public class TvpController {
	@Inject
	private TvpService service;

	@RequestMapping("/list")
	public String list(Model model) {
		model.addAttribute("tvplist", service.list());
		System.out.println(service.list());
		return "tvp/list";
	};
}
