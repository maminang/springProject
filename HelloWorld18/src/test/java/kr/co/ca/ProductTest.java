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

//	@Test
//	public void testBasicForm() {
//	
//	}
	@Test
	public void testInsert() {
		ProductDTO dto = new ProductDTO(-1, "Grapefruit Cologne", "그레이프프루트 코롱",
				"스페인 해안의 수많은 자몽 과수원. 자몽의 맑고 명랑한 느낌에 로즈마리, 페퍼민트, 피멘토의 톡 쏘는 향을 더했습니다. 산뜻한 느낌. 기분 좋아지는 향수입니다.", 30, 93000,
				"citrus", new String[] { "이미지 입니다" });
		dao.write(dto);
	}

	@Test
	public void testAddImages() {
		String[] images = new String[] {"asdf","1234"}; 
		dao.addImages(images, 3);
	}

	@Test
	public void testSearchProduct() {
		String keyword = "Grapefruit";
		List<ProductDTO> list = dao.searchProduct(keyword);
		System.out.println(list);
		dao.getImages(list);
		System.out.println(list);
	}
	
	@Test
	public void testGetBestSellers() {
		List<ProductDTO> list = dao.getBestSellers();
		if (list == null) {
			System.out.println("tbl_sold에 데이터가 없음");
		}
		for (ProductDTO dto : list) {
			System.out.println(dto);
		}
	}

	@Test
	public void testGetNewProducts() {
		List<ProductDTO> list = dao.getNewProducts();
		for (ProductDTO dto : list) {
			System.out.println(dto);
		}
	}
}