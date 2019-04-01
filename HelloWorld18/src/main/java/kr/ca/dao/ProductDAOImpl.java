package kr.ca.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

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
	
//	장바구니에 담기
	@Override
	public void insertShoppingCart(String id, int pno, int amount) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id", id);
		map.put("pno", pno);
		map.put("amount", amount);
		System.out.println("impl"+amount+"id"+id+"pno"+pno);
		System.out.println(map);
		
		Object oAmount = session.selectOne(NS+".checkAmount", map);
		if(oAmount == null) {
			session.insert(NS+".insertShoppingCartNull", map);
		} else {
			System.out.println(1111111111);
			System.out.println("impl"+amount);
			session.insert(NS+".insertShoppingCart", map);
		}
		
		
	}
//	장바구니 id로 select
	@Override
	public List<ShoppingCartDTO> selectShoppingCart(String id) {
		
		 
		return session.selectOne(NS+".selectShoppingCart", id); 
		
	}

}
