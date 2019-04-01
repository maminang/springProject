package kr.ca.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		
		if (dto == null) {
			return;
		}
		session.setAttribute("login", mdto);
	}

////로그아웃	
//	@RequestMapping(value = "/logout", method = RequestMethod.GET)
//	public String logout(LoginDTO dto, HttpSession session) throws Exception {
//		
//		Object login=session.getAttribute("login");
//		if(login!=null) {
//			session.removeAttribute("login");
//		}
//		return "/main";
//		
//	}

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
		
		LoginDTO login=(LoginDTO)session.getAttribute("login");
		MemberDTO mDto=service.mypage(login);
		model.addAttribute("mDto", mDto);
	}

	
	
//	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
//	public void mypageUI(LoginDTO dto, Model model) {
//		dto = service.mypage(dto);
//		System.out.println(dto + "히히히히히히");
//		if (dto == null) {
//			return;
//		}
//		model.addAttribute("dto", dto);
//	}


}
