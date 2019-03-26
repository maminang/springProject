package kr.co.ca;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.dao.MessageDAO;
import kr.co.domain.MessageVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MessageDAOTest {
	@Inject
	private MessageDAO dao;

	@Test
	public void createTest() {
		int mid = 1;
		MessageVO vo = new MessageVO(mid, "user1", "user2", "안녕하세요", null, null);
		dao.create(vo);
	}

	@Test
	public void readMessage() {
		int mid = 1;
		MessageVO vo = dao.readMessage(mid);
		System.out.println(vo);
	}
	
	@Test
	public void updateState() {
		int mid = 1;
		dao.updateState(mid);
	}
}
