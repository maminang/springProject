package kr.ca.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ca.dao.OrderDAO;
import kr.ca.dao.ProductDAO;
import kr.ca.domain.OrderDTO;
import kr.ca.domain.OrderDetailDTO;
import kr.ca.domain.ProductDTO;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO dao;
	@Inject
	private ProductDAO pdao;

	@Override
	public List<OrderDetailDTO> getDetailList(String id) {
		List<OrderDetailDTO> detailList = dao.getDetailList(id);
		for (OrderDetailDTO oddto : detailList) {
			ProductDTO pdto = pdao.selectProduct(oddto.getPno());
			pdao.getImages(pdto);
			oddto.setPdto(pdto);
		}
		return detailList;
	}

	@Override
	public void setOrderMemberInfo(String id, OrderDTO order) {
		dao.setOrderMemberInfo(id,order);
	}
}
