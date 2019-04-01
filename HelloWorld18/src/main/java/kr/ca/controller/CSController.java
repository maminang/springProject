package kr.ca.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ca.domain.CSDTO;
import kr.ca.domain.Criteria;
import kr.ca.domain.PageMaker;
import kr.ca.service.CSService;

@RequestMapping("/cs")
@Controller
public class CSController {

	@Inject
	private CSService service;
	
	@RequestMapping(value = "csCenter", method = RequestMethod.GET)
	public String csList(Criteria cri, Model model) {
		
		
		int amount=service.getAmount();
		
		PageMaker pm=new PageMaker(amount,cri);
		
		List<CSDTO> cslist = service.listPage(cri);
		
		model.addAttribute("pm",pm);
		model.addAttribute("cslist",cslist);
		System.out.println(pm);
		System.out.println(cslist);
		try {
			cslist = service.csList();
			System.out.println("cslist에 데이터 잘 넣었나?"+cslist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "cs/csCenter";
	}
	
	
}
