package kr.ca.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.ProductDTO;
import kr.ca.domain.ShoppingCartDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession session;
	private final String NS = "kr.ca.mapper.product";

	@Override
	public void write(ProductDTO dto) {
		dto.setPno(getPno());
		System.out.println(dto);
		session.insert(NS + ".insert", dto);
	}

	private int getPno() {
		Integer pno = session.selectOne(NS + ".getPno");
		if (pno != null)
			pno += 1;
		else
			pno = 1;

		return (int) pno;
	}

	@Override
	public void addImages(String fullName, int pno) {
		int pino = getPino();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullName", fullName);
		map.put("pno", pno);
		map.put("pino", pino);
		session.insert(NS + ".addImages", map);
	}

	private int getPino() {
		Integer pino = session.selectOne(NS + ".getPino");
		if (pino != null)
			pino += 1;
		else
			pino = 1;

		return (int) pino;
	}

//  제품 검색 (이미지는 안 들어감 서비스단에서 addImages(list) 호출하면 이미지 들어가요)
	@Override
	public List<ProductDTO> searchProduct(String keyword) {
		List<ProductDTO> list = session.selectList(NS + ".searchProduct", keyword);
		return list;
	}

// 제품리스트에 이미지 파일을 넣어주는 메서드
	@Override
	public void getImages(List<ProductDTO> list) {
		for (ProductDTO dto : list) {
			List<String> imageList = session.selectList(NS + ".getImages", dto.getPno());
			String[] images = imageList.toArray(new String[imageList.size()]);
			dto.setImages(images);
		}
	}

//  베스트 셀러 6개 리스트 뽑아오기
	@Override
	public List<ProductDTO> getBestSellers() {
		RowBounds rb = new RowBounds(0, 6);
		return session.selectList(NS + ".getBestSeller", null, rb);
	}

//  신제품 6개 리스트 뽑아오기
	@Override
	public List<ProductDTO> getNewProducts() {
		RowBounds rb = new RowBounds(0, 6);
		return session.selectList(NS + ".getNewProducts", null, rb);
	}

}
