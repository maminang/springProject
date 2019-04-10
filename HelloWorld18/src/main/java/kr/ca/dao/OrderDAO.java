package kr.ca.dao;

import java.util.List;

import kr.ca.domain.OrderDTO;
import kr.ca.domain.OrderDetailDTO;

public interface OrderDAO {

	List<OrderDetailDTO> getDetailList(String id);

	void setOrderMemberInfo(String id, OrderDTO order);

}
