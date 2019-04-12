package kr.ca.service;

import java.util.List;

import kr.ca.domain.MemberDTO;
import kr.ca.domain.OrderDTO;
import kr.ca.domain.OrderDetailDTO;

public interface OrderService {

	List<OrderDetailDTO> getDetailList(String id);

	void setOrderMemberInfo(OrderDTO order);

	MemberDTO getPoint(String id);

	boolean checkPoint(String id, int total_price);

	void complete(OrderDTO order, String id);

	List<OrderDTO> list(String id);

	OrderDTO readOrder(int ono);

}
