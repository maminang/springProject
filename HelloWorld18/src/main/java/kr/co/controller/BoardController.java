package kr.co.controller;

import java.io.File;
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

import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.PageMaker;
import kr.co.domain.SearchCriteria;
import kr.co.service.BoardService;
import kr.co.utils.MediaUtils;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Inject
	private BoardService service;
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping
	public String basicForm() {
		return "";
	}

	@RequestMapping("/list")
	public String list(Criteria cri, Model model) {
		List<BoardVO> list = service.listPage(cri);
		model.addAttribute("list", list);

		int amount = service.getAmount();
		PageMaker pm = new PageMaker(amount, cri);
		model.addAttribute("pm", pm);

		return "board/list";
	}

	@RequestMapping("/listpage")
	public String listPage(Criteria cri, Model model) {
		int amount = service.getAmount();

		List<BoardVO> list = service.listPage(cri);
		PageMaker pm = new PageMaker(amount, cri);

		model.addAttribute("list", list);
		model.addAttribute("pm", pm);

		return "board/list";
	}

	@RequestMapping("/read")
	public String read(Model model, int bno, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("vo", service.read(bno));
		return "board/read";
	}

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String writeUI() {
		return "board/write";
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO vo) {
		service.insert(vo);
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateUI(Model model, int bno, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("vo", service.read(bno));
		return "board/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO vo, Criteria cri, Model model) {
		service.update(vo);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		return "redirect:/board/list";
	}

	@RequestMapping("/delete")
	public String delete(int bno, Criteria cri, Model model) {
		service.delete(bno);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("perPage", cri.getPerPage());
		return "redirect:/board/list";
	}

	@RequestMapping("/search")
	public String search(SearchCriteria cri, Model model) {

		List<BoardVO> list = service.search(cri);
		model.addAttribute("list", list);

		int amount = service.getSearchAmount(cri);

		PageMaker pm = new PageMaker(amount, cri);
		model.addAttribute("pm", pm);

		return "/board/search";
	}

	@RequestMapping("/sread")
	public String sRead(Model model, int bno, @ModelAttribute("cri") SearchCriteria cri) {
		model.addAttribute("vo", service.selectByBno(bno));
		return "/board/sread";
	}

	@RequestMapping(value = "supdate", method = RequestMethod.GET)
	public String sUpdateUI(Model model, int bno, @ModelAttribute("cri") SearchCriteria cri) {
		model.addAttribute("vo", service.read(bno));
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());
		return "board/supdate";
	}

	@RequestMapping(value = "supdate", method = RequestMethod.POST)
	public String sUpdate(BoardVO vo, SearchCriteria cri, RedirectAttributes attr) {
		service.update(vo);
		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPage", cri.getPerPage());
		attr.addAttribute("searchType", cri.getSearchType());
		attr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/board/search";
	}

	@RequestMapping("sdelete")
	public String sDelete(int bno, SearchCriteria cri, RedirectAttributes attr) {
		service.delete(bno);
		attr.addAttribute("page", cri.getPage());
		attr.addAttribute("perPage", cri.getPerPage());
		attr.addAttribute("searchType", cri.getSearchType());
		attr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/search";
	}

	@ResponseBody
	@RequestMapping("getAttach/{bno}")
	public List<String> getAttach(@PathVariable Integer bno) {
		return service.getAttach(bno);
	}

	@ResponseBody
	@RequestMapping(value = "deleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName, int bno) {
		ResponseEntity<String> entity = null;

		File file = new File(uploadPath + fileName.replace('/', File.separatorChar));
		
		try {
			file.delete();
			service.deleteAttach(fileName,bno);

			String formatType = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMeidaType(formatType);
			if (mType != null) {
				String prefix = fileName.substring(0, 12);
				String suffix = fileName.substring(14);
				File imgOriginalFile = new File(uploadPath + prefix + suffix);
				imgOriginalFile.delete();
			}
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}
}
