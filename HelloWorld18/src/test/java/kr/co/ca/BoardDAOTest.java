package kr.co.ca;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dao.BoardDAO;
import kr.co.domain.BoardVO;
import kr.co.domain.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class BoardDAOTest {
	@Inject
	private BoardDAO dao;

//	@Test
//	public void testBasicForm() {
//	
//	}

	@Test
	public void testList() {
		List<BoardVO> list = dao.list();
		for (BoardVO vo : list) {
			System.out.println();
			System.out.println(vo);
		}
	}

	@Test
	public void testSelectByBno() {
		System.out.println(dao.selectByBno(1));
	}

	@Test
	public void insert() {
		BoardVO vo = new BoardVO(0, "title", "content", "writer", null, null, 0, null);
		dao.insert(vo);
	}

	@Test
	public void update() {
		BoardVO vo = new BoardVO(1, "제목", "내용", "작성자", null, null, 0, null);
		dao.update(vo);
	}

	@Test
	public void testGetAmount() {
		int result = dao.getAmount();
		System.out.println(result);
	}

	@Test
	public void testSearch() {
		SearchCriteria cri1 = new SearchCriteria("title", "페이징");
		SearchCriteria cri2 = new SearchCriteria("writer", "임하민");
		SearchCriteria cri3 = new SearchCriteria("content", "ㅁㄴㅇㄹ");

		SearchCriteria cri4 = new SearchCriteria("writer", "upper");
		SearchCriteria cri5 = new SearchCriteria("content", "LOWER");

		List<BoardVO> list = dao.search(cri1);
		System.out.println(list);

		list = dao.search(cri2);
		System.out.println(list);

		list = dao.search(cri3);
		System.out.println(list);

		list = dao.search(cri4);
		System.out.println(list);

		list = dao.search(cri5);
		System.out.println(list);

	}

	@Test
	public void testBasicForm() {
		SearchCriteria cri = new SearchCriteria("title", "페이징");
		int amount = dao.getSearchAmount(cri);
		System.out.println(amount);
	}

}
