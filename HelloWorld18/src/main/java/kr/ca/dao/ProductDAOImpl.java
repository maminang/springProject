package kr.ca.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import kr.ca.domain.ProductDTO;
import kr.ca.domain.ProductDetailDTO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession session;
	private final String NS = "kr.ca.mapper.product";

	@Override
	public void insert(ProductDTO dto) {
		dto.setPno(getPno());
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

//	select * Product id로 검색
	@Override
	public ProductDTO selectProduct(ProductDTO dto) {

		return session.selectOne(NS + ".selectProduct", dto);
	}

//	select * ProductDetail id로 검색
	@Override
	public List<ProductDetailDTO> selectProductDetail(int pno) {

		return session.selectList(NS + ".selectProductDetail", pno);
	}

	@Override
	public ProductDetailDTO selectOneProductDetail(int pno, int volume) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", pno);
		map.put("volume", volume);
		
		return session.selectOne(NS + ".selectOneProductDetail", map);
	}

	@Override
	public int selectCountProductDetail() {
		 
		return session.selectOne(NS+".selectCountProductDetail");
	}

}
