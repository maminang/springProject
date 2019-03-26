package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.domain.TestDTO;
import kr.co.service.TestService;

@Controller
@RequestMapping("/test")
public class TestController {

	@Inject
	private TestService service;

	@RequestMapping("/insert1")
	public String insert(TestDTO dto, Model model) {
		service.insert(dto, model);
		model.addAttribute("keyTest", "valueTest");

		return "test/list";
	}

	@RequestMapping("/list")
	public String list(Model model) {
		List<TestDTO> list = service.list();
		model.addAttribute("list", list);

		return "test/list";
	}

	@RequestMapping("/writeUI")
	public String writeUI() {
		return "test/write";
	}

	@RequestMapping("/write")
	public String write(TestDTO dto) {
		service.write(dto);
		return "redirect:/test/list";
	}

	@RequestMapping("/read")
	public String read(Model model, int num) {
		TestDTO dto = service.read(num);
		model.addAttribute("dto", dto);
		return "test/read";
	}

	@RequestMapping("/updateUI")
	public String updateUI(Model model, int num) {
		model.addAttribute("dto", service.read(num));
		return "test/update";
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(TestDTO dto) {
		service.update(dto);
		return "redirect:/test/list";
	}
	
	@RequestMapping("delete")
	public String delete(int num) {
		service.delete(num);
		return "redirect:/test/list";
	}

}
