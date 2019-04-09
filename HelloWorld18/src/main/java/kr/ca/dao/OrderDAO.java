package kr.ca.dao;

import kr.ca.domain.OrderDTO;

public interface OrderDAO {

	OrderDTO checkOut(String id);

}
