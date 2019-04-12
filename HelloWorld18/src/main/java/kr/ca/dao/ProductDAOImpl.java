package kr.ca.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
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
	public void write(ProductDTO dto, int[] volume, int[] price) {
		dto.setPno(getPno());
		session.insert(NS + ".write", dto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pno", dto.getPno());
		for (int i = 0; i < volume.length; i++) {
			map.put("volume", volume[i]);
			map.put("price", price[i]);
			session.insert(NS+".writeDetail", map);
		}
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
	public void addImages(String[] images, int pno) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		for (String image : images) {
			map.put("fullName", image);
			map.put("pno", pno);
			int pino = getPino();
			map.put("pino", pino);
			session.insert(NS + ".addImages", map);
		}
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
	public void getImages(ProductDTO dto) {
		List<String> imageList = session.selectList(NS + ".getImages", dto.getPno());
		String[] images = imageList.toArray(new String[imageList.size()]);
		dto.setImages(images);
	}
	
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

//  카테고리로 리스트 뽑아오기
	@Override
	public List<ProductDTO> getListByCategory(String category) {
		return session.selectList(NS+".getListByCategory", category);
	}

	@Override
	public ProductDTO selectProduct(int pno) {
		return session.selectOne(NS+".selectProduct", pno);
	}

//	select * Product id로 검색
	@Override
	public ProductDTO selectProduct(ProductDTO dto) {
		ProductDTO newDTO = session.selectOne(NS + ".selectProduct", dto);
		getImages(newDTO);
		return newDTO;
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
