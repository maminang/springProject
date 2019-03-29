package kr.ca.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.ca.domain.FooterInfoDTO;
import kr.ca.domain.MenuDTO;
import kr.ca.service.MainService;

@RestController
public class MainController {

	@Inject
	private MainService service;
	
	@RequestMapping(value = "menu", method = RequestMethod.GET)
	public List<MenuDTO> getMenu() {
		List<MenuDTO> list = null;
		
		try {
			list = service.getMenu();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@RequestMapping(value="footerInfo", method = RequestMethod.GET)
	public FooterInfoDTO getFooterInfo() {
		FooterInfoDTO dto = null;
		
		try {
			dto = service.getFooterInfo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
