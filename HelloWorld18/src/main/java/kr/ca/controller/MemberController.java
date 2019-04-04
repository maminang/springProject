package kr.ca.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ca.domain.ChargeHistoryDTO;
import kr.ca.domain.LoginDTO;
import kr.ca.domain.MemberDTO;
import kr.ca.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService service;

//로그인	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {

	}

	@RequestMapping(value = "/loginpost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpSession session) throws Exception {
		LoginDTO mdto = service.login(dto);
		if (dto != null) {
			session.setAttribute("login", mdto);
		}
	}

//로그아웃	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(LoginDTO dto, HttpSession session) throws Exception {
		Object login = session.getAttribute("login");
		if (login != null) {
			session.removeAttribute("login");
		}
		return "/main";

	}

//회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup(MemberDTO dto) {

		return "member/signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signuppage(MemberDTO dto) {
		service.insert(dto);
		return "member/login";
	}

//마이페이지
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public void mypageUI(HttpSession session, Model model) {

		LoginDTO login = (LoginDTO) session.getAttribute("login");
		MemberDTO mDto = service.mypage(login);
		model.addAttribute("mDto", mDto);
	}

//회원정보 수정
	@RequestMapping("/updateui")
	public String updateui(Model model, String id) {
		MemberDTO dto = service.updateui(id);
		model.addAttribute("dto", dto);
		return "board/update";
	}

	@RequestMapping("/update")
	public String update(MemberDTO dto) {
		service.update(dto);
		return "redirect:/member/mypage";
	}

//id 체크
	@RequestMapping("/idcheck")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String id) {

		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();

		count = service.idcheck(id);
		map.put("cnt", count);

		return map;
	}

// 포인트 충전
	@RequestMapping("pointCharge")
	public String pointCharge() {
		return "member/pointcharge";
	}

	@RequestMapping(value = "pointCharge", method = RequestMethod.POST)
	public String pointCharge(String id, int point) {
		service.pointCharge(id, point);
		return "redirect:/member/mypage/";
	}

	@ResponseBody
	@RequestMapping("getChargeHistory/{id}")
	public ResponseEntity<List<ChargeHistoryDTO>> getChargeHistory(@PathVariable String id) {
		ResponseEntity<List<ChargeHistoryDTO>> entity = null;
		List<ChargeHistoryDTO> list = null;
		try {
			list = service.getChargeHistory(id);
			entity = new ResponseEntity<List<ChargeHistoryDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<List<ChargeHistoryDTO>>(list, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
