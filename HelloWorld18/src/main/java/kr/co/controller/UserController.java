package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;
import kr.co.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Inject
	private UserService service;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void getLogin() {

	}

	@RequestMapping(value = "loginpost", method = RequestMethod.POST)
	public void login(LoginDTO dto, Model model) {
		UserVO userVO = service.login(dto);
		if (userVO == null) 
			return;
		model.addAttribute("userVO", userVO);
	}
}
