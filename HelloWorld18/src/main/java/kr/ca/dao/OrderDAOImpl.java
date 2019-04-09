package kr.ca.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.OrderDTO;
import kr.ca.domain.OrderDetailDTO;
import kr.ca.domain.ProductDTO;
import kr.ca.domain.ProductDetailDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.OrderMapper";

	@Override
	public OrderDTO checkOut(String id) {
		OrderDTO dto = new OrderDTO();
		
		// 장바구니에서 
		List<OrderDetailDTO> list = oddtoList(id);
		
		for (OrderDetailDTO oddto : list) {
			ProductDTO pdto = getPdto(oddto);
			oddto.setPdto(pdto);
		}
		
		return dto;
	}

	private List<OrderDetailDTO> oddtoList(String id) {
		return session.selectList(NS + ".oddtoList", id);
	}

	private ProductDTO getPdto(OrderDetailDTO oddto) {
		return session.selectOne(NS + ".getPdto", oddto);
	}
}
