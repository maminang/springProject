package com.naver.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.domain.MemberDTO;

@Controller
public class MyController {

	@RequestMapping("/doA")
	public void doA() {
		System.out.println();
	}

	@RequestMapping("/doB")
	public void doB(MemberDTO dto) {
		System.out.println(dto);
	}

	@RequestMapping("/doE")
	public String doE(Model model) {
		return "doE";
	}

	@RequestMapping("/doF")
	public String doF(Model model) {
		System.out.println("doF");
		return "redirect:/doG";
	}

	@RequestMapping("/doG")
	public String doG() {
		System.out.println("doG");
		return "doG";
	}

	@RequestMapping("/doH")
	public String doH(Model model) {
		System.out.println("doG");
		model.addAttribute("show", "show");
		return "redirect:/doI";
	}

	@RequestMapping("/doI")
	public String doI(String show) {
		System.out.println(show);
		return "doI";
	}

	@RequestMapping("/doJ")
	public String doJ(Model model) {
		System.out.println("doJ");
		model.addAttribute("newK", "new");
		return "redirect:/doK";
	}

	@RequestMapping("/doK")
	public String doK(Model model, String newK) {
		model.addAttribute("newK", newK);
		return "doK";
	}

	@RequestMapping("/doL")
	public String doL(Model model) {
		model.addAttribute("simple", "simple");
		return "redirect:/doM";
	}

	@RequestMapping("/doM")
	public String doM(@ModelAttribute("simple") String simple) {
		return "doM";
	}

	@RequestMapping("/doO")
	public String doO(RedirectAttributes rtts) {

		rtts.addFlashAttribute("rttr", "rttr");

		return "redirect:/doP";
	}

	@RequestMapping("doP")
	public String doP(@ModelAttribute("rttr") String rttr) {
		return "doP";
	}

	@RequestMapping("/doQ")
	public @ResponseBody MemberDTO doQ() {
		MemberDTO dto = new MemberDTO(1, "kk", 22);

		return dto;
	}

	@RequestMapping("/doR")
	public void doR(@RequestParam int num) {
		System.out.println(num);
	}

	@RequestMapping("/doS")
	public ModelAndView doS() {
		ModelAndView mav = new ModelAndView("sorry");
		mav.addObject("str", "This train is for Shindorim");
		return mav;
	}
	
}
