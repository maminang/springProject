package kr.co.ca;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ca.dao.MemberDAO;
import kr.ca.domain.ChargeHistoryDTO;
import kr.ca.domain.LoginDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MemberTest {
	@Inject
	private MemberDAO dao;

//	@Test
//	public void testBasicForm() {
//	
//	}
	@Test
	public void testPointCharge() {
		dao.pointCharge("NamepeN", 100);
		LoginDTO login = new LoginDTO("NamepeN", "qlalfqjsgh");
		System.out.println(dao.mypage(login));
	}
	
	@Test
	public void testGetChargeHistory() {
		List<ChargeHistoryDTO> list = dao.getChargeHistory("NamepeN");
		System.out.println(list);
	}
}