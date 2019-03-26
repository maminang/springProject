package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.domain.MemberDTO;
import kr.co.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Inject
	private MemberService service;

	@RequestMapping("/insertui")
	public String insertui() {
		return "member/insert";
	}

	@RequestMapping("/insert")
	public String insert(MemberDTO dto) {
		service.insert(dto);
		return "redirect:/member/select";
	}

	@RequestMapping("/select")
	public String select(Model model) {
		model.addAttribute("list", service.select());
		return "member/select";
	}

	@RequestMapping("/selectById")
	public String selectById(Model model, int id) {
		model.addAttribute("dto", service.selectById(id));
		return "member/selectById";
	}

	@RequestMapping("/updateui")
	public String updateui(Model model, int id) {
		model.addAttribute("dto", service.updateui(id));
		return "member/update";
	}

	@RequestMapping("/update")
	public String update(MemberDTO dto) {
		service.update(dto);
		return "redirect:/member/select";
	}

	@RequestMapping("/delete")
	public String delete(int id) {
		service.delete(id);
		return "redirect:/member/select";
	}
}
