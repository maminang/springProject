package kr.co.restcontroller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.domain.BoardVO;
import kr.co.service.BoardService;

@RestController
@RequestMapping("sample")
public class SampleController {

	@Inject
	private BoardService service;

	@RequestMapping("hello")
	public String hello() {
		return "Hello, everyone";
	}

	@RequestMapping("sendvo")
	public BoardVO sendVO() {
		return new BoardVO(1, "title", "content", "writer", null, null, 4, null);
	}

	@RequestMapping("sendlist")
	public List<BoardVO> sendList() {
		return service.list();
	}

	@RequestMapping("sendmap")
	public Map<Integer, BoardVO> sendMap() {
		List<BoardVO> list = service.list();
		Map<Integer, BoardVO> map = new HashMap<Integer, BoardVO>();

		Iterator<BoardVO> it = list.iterator();
		int a = 1;
		while (it.hasNext()) {
			map.put(a++, it.next());
		}

		return map;
	}

	@RequestMapping("senderror")
	public ResponseEntity<Void> sender() {
		return new ResponseEntity<Void>(HttpStatus.BAD_GATEWAY);
	}

	@RequestMapping("sendlistnot")
	public ResponseEntity<List<BoardVO>> sendListNot() {
		return new ResponseEntity<List<BoardVO>>(service.list(), HttpStatus.NOT_FOUND);
	}
}
