package kr.ca.service;

import java.util.List;

import kr.ca.domain.ProductDTO;

public interface ListService {
	List<ProductDTO> getListByCategory(String category);
}
