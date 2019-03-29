package kr.ca.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ca.domain.MemberDTO;
import kr.ca.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {

	@Inject
	private MemberService service;
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String getLogin() {
		return "board/login";
	}

	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String signup(MemberDTO dto) {
		
		return "board/signup";
	}
	
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String signuppage(MemberDTO dto) {
		service.insert(dto);
		System.out.println(dto+"::::::::::::::::");
		return "board/login";
	}
}
