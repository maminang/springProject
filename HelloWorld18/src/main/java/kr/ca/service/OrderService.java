package kr.ca.service;

import java.util.List;

import kr.ca.domain.OrderDTO;
import kr.ca.domain.ProductDetailDTO;

public interface OrderService {

	OrderDTO checkOut(String id);

}
