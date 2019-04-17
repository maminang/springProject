package kr.ca.controller;

import java.io.File;
import java.net.InetAddress;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.ca.domain.SearchCriteria;
import kr.ca.domain.CSDTO;
import kr.ca.domain.Criteria;
import kr.ca.domain.PageMaker;
import kr.ca.service.CSService;
import kr.ca.utils.MediaUtils;

@Controller
@RequestMapping("/cs")
public class CSController {

	@Inject
	private CSService service;

	// 리스트 출력
	@RequestMapping("/csCenter")
	public String list(Criteria cri, Model model) {
		List<CSDTO> list = service.listPage(cri);
		int amount = service.getAmount();

		PageMaker pm = new PageMaker(amount, cri);

		model.addAttribute("pm", pm);
		model.addAttribute("list", list);

		return "cs/csCenter";
	}

	// 파일 업로드
	@Resource(name = "uploadPath")
	private String uploadPath;



//	@RequestMapping("/list")
//	public String list (Model model) {
//		List<BoardVO> list = service.list();
//		model.addAttribute("list",list);
//		
//		return"board/list";
//	}

	// 글쓰기
	@RequestMapping(value = "/insertui", method = RequestMethod.GET)
	public String insertui() {

		return "cs/insert";
	}

	@RequestMapping(value = "/insert", method = { RequestMethod.GET, RequestMethod.POST })
	public String insert(CSDTO vo) {
		/* vo.setQfile(vo.getQfile().substring(14)); */
		/* String qfile = vo.getQfile(); */
		
		//211.183.8.73:8089/resources/img/csCenter.jpg
		// 서버 컴퓨터의 ip주소 :8089
		getIpAdress();
		
		//절대경로
		String dirFront = "c:supload";
		/* String dirFront = "c:supload"; */
		// 디렉토리
		String dirName = vo.getQfile().substring(1, 13);
		// 파일명
		String fileName = vo.getQfile().substring(15);
		
		//디렉토리 가공
		String dir=dirFront+dirName+fileName;
		dir=dir.replaceAll("/","테스트");

		
		vo.setQfile(dir);

		service.insert(vo);
		return "redirect:/cs/csCenter";
	}

	@RequestMapping(value = "/csRead", method = RequestMethod.GET)
	public void read(int bno, Criteria cri, Model model) {

		CSDTO vo = service.read(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("cri", cri);
	}

	@RequestMapping(value = "/updateauthority", method = RequestMethod.GET)
	public String updateauthority(int bno, Model model, @ModelAttribute("cri") Criteria cri) {

		CSDTO vo = service.updateUI(bno);
		model.addAttribute("vo", vo);

		return "cs/updateauthority";
	}

	// 답글 작성
	@RequestMapping(value = "/answerui", method = RequestMethod.GET)
	public String answerui(int bno, Model model, @ModelAttribute("cri") Criteria cri) {

		CSDTO vo = service.answerui(bno);

		model.addAttribute("vo", vo);

		return "cs/answer";
	}

	@RequestMapping("/answer")
	public String answer(CSDTO vo, Criteria cri, Model model) {

		service.answer(vo);

		/* 수정하는 글이 몇 페이지에 있던 글인지 받아온 데이터를 바인딩 */
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		return "redirect:/cs/csCenter";
	}

	@RequestMapping(value = "/updateui", method = RequestMethod.GET)
	public void updateui(int bno, Model model, @ModelAttribute("cri") Criteria cri) {

		CSDTO vo = service.updateUI(bno);
		model.addAttribute("vo", vo);

	}

	@RequestMapping("/update")
	public String update(CSDTO vo, Criteria cri, Model model) {

		service.update(vo);

		/* 수정하는 글이 몇 페이지에 있던 글인지 받아온 데이터를 바인딩 */
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		return "redirect:/cs/csCenter";
	}

	@RequestMapping(value = "/deleteui", method = RequestMethod.GET)
	public String deleteui(int bno, Model model, @ModelAttribute("cri") Criteria cri) {

		CSDTO vo = service.deleteui(bno);
		model.addAttribute("vo", vo);

		return "cs/delete";
	}

	@RequestMapping("/delete")
	public String delete(int bno, Criteria cri, Model model) {

		service.delete(bno);

		/* 수정하는 글이 몇 페이지에 있던 글인지 받아온 데이터를 바인딩 */
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		return "redirect:/cs/csCenter";
	}

	@RequestMapping("/listpage")
	public String listPage(Criteria cri, Model model) {
		int page = 1;
		List<CSDTO> list = service.listPage(cri);
		model.addAttribute("list", list);
		return "cs/csCenter";
	}

	@RequestMapping("/search")
	public void search(SearchCriteria cri, String keyword, Model model) {
		List<CSDTO> list = service.search(cri);
		model.addAttribute("list", list);

		int amount = service.getSearchAmount(cri);
		PageMaker pm = new PageMaker(amount, cri);
		model.addAttribute("pm", pm);
		pm.setCri(cri);
	}

	@RequestMapping("/sread")
	public void sRead(int bno, SearchCriteria cri, Model model) {
		CSDTO vo = service.read(bno);
		model.addAttribute("vo", vo);
		model.addAttribute("cri", cri);
	}

	@RequestMapping(value = "/sdelete", method = RequestMethod.POST)
	public String sDelete(int bno, SearchCriteria cri, RedirectAttributes rttr) {
		service.delete(bno);

		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPage", cri.getPerPage());
		return "redirect:/cs/search";
	}

	@RequestMapping(value = "supdateui", method = RequestMethod.GET)
	public void sUpdateUI(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) {
		CSDTO vo = service.updateUI(bno);
		model.addAttribute("vo", vo);

	}

	@RequestMapping("/supdate")
	public String update(CSDTO vo, SearchCriteria cri, RedirectAttributes rttr) {
		service.update(vo);

		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());

		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPage", cri.getPerPage());
		return "redirect:/board/search";
	}

	

	public void getIpAdress() {
		try {
			InetAddress ip = InetAddress.getLocalHost();
		} catch (Exception e) {
		}
		
	}
}
