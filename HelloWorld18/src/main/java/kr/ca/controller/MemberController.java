package kr.ca.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ca.dao.MemberDAO;
import kr.ca.domain.ChargeHistoryDTO;
import kr.ca.domain.LoginDTO;
import kr.ca.domain.MemberDTO;
import kr.ca.service.MemberService;
import kr.ca.utils.Email;
import kr.ca.utils.EmailSender;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Inject
	private MemberService service;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	@Autowired
	private EmailSender emailSender;
	@Autowired
	private Email email;
	@Autowired
	private MemberDAO dao;
//비밀번호 찾기시 필요
	Random r = new Random();
	int num = r.nextInt(89999) + 10000;

//로그인	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void login() {

	}

	@RequestMapping(value = "/loginpost", method = RequestMethod.POST)
	public void loginPost(LoginDTO dto, HttpSession session,Model model) throws Exception {
		LoginDTO mdto = service.login(dto);
		System.out.println("mdto::::::::::::::::"+mdto.getPw());
		System.out.println("dto::::::::::::::::"+dto.getPw());
		boolean passMatch=passEncoder.matches(dto.getPw(),mdto.getPw());
		System.out.println("passMatch:::::::::::::::::"+passMatch);
		System.out.println("dto.getPw():::::::::::::::"+dto.getPw());
		System.out.println("mdto.getPw()::::::::::::::"+mdto.getPw());
		if (dto != null && passMatch) {
			session.setAttribute("login", mdto);
		}else {
	         session.setAttribute("login", null);
	         return;
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
		
		//입력비밀번호
		String inputPass=dto.getPw();
		//암호화 후
		String pass=passEncoder.encode(inputPass);
		dto.setPw(pass);
		
		service.insert(dto);
		return "member/login";
	}
	
//비밀번호 분실시 새로운 비밀번호
	
	@RequestMapping("/newPassword")
	
	public String newPassword(String id, LoginDTO dto, HttpSession session) throws Exception {
		String newPW =Integer.toString(num);// 새로운 비밀번호 변경
		
		String pass=passEncoder.encode(newPW);//암호화
		dto.setPw(pass);
		
		session.setAttribute("dto", dto);
		
		service.newPW(dto);
		return "redirect:/member/findPassword";
		
	}
	
// 이메일로 비밀번호가 전송이된다.
	
	@RequestMapping("/findPassword")
	
	public String findPasswordOK(LoginDTO dto, HttpSession session) throws Exception {
		LoginDTO ldto = (LoginDTO) session.getAttribute("dto");
		MemberDTO mdto=dao.selectMemberDTO(ldto.getId());
		mdto.setPw(ldto.getPw());
		email.setContent("새로운 비밀번호는 " + num + " 입니다. ");
		email.setReceiver(mdto.getEmail());
		email.setSubject("안녕하세요"+mdto.getId() +"님  재설정된 비밀번호를 확인해주세요");
		emailSender.SendEmail(email);
		session.invalidate();
		
		return "/member/login";
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
			MemberDTO dto= service.updateui(id);
			model.addAttribute("dto",dto);
			return "board/update";
		}
	
		@RequestMapping("/update")
		public String update(MemberDTO dto) {
			service.update(dto);
			return "redirect:/member/mypage";
		}
	
//id 중복 체크
		@RequestMapping("/idcheck")
	    @ResponseBody
	    public Map<Object, Object> idcheck(@RequestBody String id) {
	        
	        int count = 0;
	        Map<Object, Object> map = new HashMap<Object, Object>();
	 
	        count = service.idcheck(id);
	        map.put("cnt", count);
	 
	        return map;
	    }
		
//id 찾기
		@RequestMapping("/findPW")
		public String findPW(){
			return "/member/findPW";
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
	
//비밀번호 수정
	
	@RequestMapping("/updatePWUI")
	public String updatePWUI(Model model, String id, MemberDTO dto) {
		dto=service.selectMemberDTO(id);
		model.addAttribute("dto",dto);
		System.out.println("asfaf:::::::::::::::"+dto);
		return "board/updatePW";
		
	}

	@RequestMapping("/updatePW")
	public String updatePW(LoginDTO dto,String id,String pw,String oripw,HttpSession session,Model model) {
		System.out.println(oripw);
		System.out.println("id:::::::::::::::"+id);
		System.out.println("pw::::::::::::::::"+pw);
		LoginDTO mdto = service.login(dto);
		System.out.println("mdto::::::::::::::::"+mdto);
		
		boolean passMatch=passEncoder.matches(oripw,mdto.getPw());
		System.out.println("oripw::::::::::::"+oripw);
		System.out.println("mdto.getPw()::::::::::::"+mdto.getPw());
		model.addAttribute("passMatch", passMatch);
		if (passMatch) {
			//암호화 후
			String pripw=passEncoder.encode(pw);
			service.updatePW(id,pripw);
			return "redirect:/member/mypage";
		}
		return "board/updatePW";
	}
	
	
}
