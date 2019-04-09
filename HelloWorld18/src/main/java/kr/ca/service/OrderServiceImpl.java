package kr.ca.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ca.dao.OrderDAO;
import kr.ca.domain.OrderDTO;
import kr.ca.domain.ProductDetailDTO;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Inject
	private OrderDAO dao;

	@Override
	public OrderDTO checkOut(String id) {
		return dao.checkOut(id);
	}
}
