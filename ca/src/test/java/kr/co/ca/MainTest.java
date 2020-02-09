package kr.co.ca;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ca.dao.MainDAO;
import kr.ca.domain.FooterInfoDTO;
import kr.ca.domain.MenuDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MainTest {
	@Inject
	private MainDAO dao;

//	@Test
//	public void testBasicForm() {
//	
//	}
	@Test
	public void testGetMenu() {
		List<MenuDTO> list = dao.getMenu();
		System.out.println(list);
	}
	
	@Test                        
	public void testgetFooterInfo() {
		FooterInfoDTO dto = dao.getFooterInfo();
		System.out.println(dto);
	}                            
}