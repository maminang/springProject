package kr.ca.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ca.domain.ReviewDTO;
import kr.ca.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Inject
	private ReviewService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public String insert(ReviewDTO dto) {
		System.out.println(dto);
		try {
			service.insert(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/product/read?pno="+dto.getPno();
	}

	@RequestMapping("{pno}")
	public ResponseEntity<List<ReviewDTO>> getReviewList(@PathVariable("pno") int pno) {
		ResponseEntity<List<ReviewDTO>> entity = null;

		try {
			List<ReviewDTO> list = service.getReviewList(pno);
			entity = new ResponseEntity<List<ReviewDTO>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String reviewDelete(int rno, int pno) {
		service.delete(rno);
		return "redirect:/product/read?pno="+pno;
	}
}
