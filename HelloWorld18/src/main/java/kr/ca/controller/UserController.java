package kr.ca.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("user")
public class UserController {

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void getLogin() {

	}
}
