package kr.co.ca;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.ca.dao.ProductDAO;
import kr.ca.domain.ProductDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class ProductTest {
	@Inject
	private ProductDAO dao;
	
	
	@Test
	public void testSearch() {
		List<ProductDTO> list = dao.searchProduct("코롱");
		System.out.println(list);
	}
}