package kr.ca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("dealings")
public class DealingsController {

	@RequestMapping("checkout")
	public String checkout() {
		return "checkout";
	}
}
