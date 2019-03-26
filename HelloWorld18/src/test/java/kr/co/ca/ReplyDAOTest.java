package kr.co.ca;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dao.ReplyDAO;
import kr.co.domain.ReplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ReplyDAOTest {
	@Inject
	private ReplyDAO dao;

//	@Test
//	public void basicForm() {
//
//	}

	@Test
	public void testInsert() {
		ReplyVO vo = new ReplyVO(-1, 280, "replytext", "replyer", null, null);
		dao.insert(vo);
	}

	@Test
	public void testList() {
		int bno = 280;
		List<ReplyVO> list = dao.list(bno, null);
		for (ReplyVO vo : list) {
			System.out.println(vo);
		}
	}

	@Test
	public void testUpdate() {
		ReplyVO vo = new ReplyVO(15, -1, "test수정", null, null, null);
		dao.update(vo);
	}

	@Test
	public void testGetAmount() {
		int bno = 280;
		int amount=dao.getAmount(bno);
		System.out.println(amount);
	}
}
