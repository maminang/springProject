package kr.ca.service;

import java.util.List;

import kr.ca.domain.OrderDTO;
import kr.ca.domain.OrderDetailDTO;

public interface OrderService {

	List<OrderDetailDTO> getDetailList(String id);

	void setOrderMemberInfo(String id, OrderDTO order);

}
