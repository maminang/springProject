package com.naver.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.MessageVO;
import kr.co.service.MessageService;

@Controller
@RequestMapping("aop")
public class AopController {

	@Inject
	private MessageService service;

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String createUI() {
		return "aop/create";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(MessageVO vo) {
		service.create(vo);
		return "aop/list";
	}

}
