package kr.ca.dao;

import java.util.List;

import kr.ca.domain.OrderDTO;
import kr.ca.domain.OrderDetailDTO;

public interface OrderDAO {

	List<OrderDetailDTO> getDetailList(String id);

	void setOrderMemberInfo(OrderDTO order);

	boolean checkPoint(String id, int total_price);

	void complete(OrderDTO order);

	void resetShoppingCart(String id);

	void pointSpending(String id, int total_price);

	List<OrderDTO> list(String id);

	OrderDTO readOrder(int ono);

	void setDetailList(OrderDTO order);

}
