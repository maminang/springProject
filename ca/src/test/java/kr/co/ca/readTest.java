package kr.co.ca;

import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletResponse;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import kr.ca.dao.ShoppingCartDAO;
import kr.ca.domain.ShoppingCartDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class readTest {

	@Autowired
	private ShoppingCartDAO dao;

	@Test
	public void insertShoppingCartTest() {

		ShoppingCartDTO dto = new ShoppingCartDTO("NamepeN", 1, 10, -1, -1);

		dao.insertShoppingCart(dto);

	}

	@Test
	public void listShoppingCartCookie() {

//		HttpServletResponse response = null;

		ShoppingCartDTO dto = new ShoppingCartDTO("aa", 1, 2, -1, -1);
		Cookie pno = new Cookie("pno", String.valueOf(dto.getPno()));

		pno.setMaxAge(7 * 24 * 60 * 60);
		pno.setPath("/");
		System.out.println(pno.getMaxAge());
		System.out.println("111111111111111111");

//		response.addCookie(pno);

	}

}
