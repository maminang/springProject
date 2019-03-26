package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.Criteria;
import kr.co.domain.PageMaker;
import kr.co.domain.ReplyVO;
import kr.co.service.ReplyService;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	@Inject
	private ReplyService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> insert(@RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;
		try {
			service.insert(vo);
			entity = new ResponseEntity<String>("INSERT_SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/{bno}/{page}/{perPage}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> list(@PathVariable("bno") int bno, @PathVariable int page,
			@PathVariable int perPage) {
		System.out.println("bno" + bno);
		System.out.println("page" + page);
		System.out.println("perPage" + perPage);

		ResponseEntity<Map<String, Object>> entity = null;
		try {
			Criteria cri = new Criteria(page, perPage);
			List<ReplyVO> list = service.list(bno, cri);
			PageMaker pm = new PageMaker();
			int amount = service.getAmount(bno);
			pm.setCri(cri);
			pm.setAmount(amount);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("pm", pm);

			System.out.println(pm);

			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/{rno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("rno") int rno, @RequestBody ReplyVO vo) {
		ResponseEntity<String> entity = null;

		try {
			vo.setRno(rno);
			service.update(vo);
			entity = new ResponseEntity<String>("UPDATE_SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/{rno}", method = RequestMethod.DELETE)
	public ResponseEntity<Void> delete(@PathVariable("rno") int rno) {
		ResponseEntity<Void> entity = null;

		try {
			service.delete(rno);
			entity = new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Void>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	@RequestMapping(value = "/checkID/{inputID}", method = RequestMethod.GET)
	public ResponseEntity<Boolean> checkID(@PathVariable("inputID") String inputID) {
		ResponseEntity<Boolean> entity = null;
		Boolean isValid = false;

		try {
			isValid = service.checkID(inputID);
			entity = new ResponseEntity<Boolean>(isValid, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<Boolean>(isValid, HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

}
