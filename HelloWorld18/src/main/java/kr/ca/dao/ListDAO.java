package kr.ca.dao;

import java.util.List;

import kr.ca.domain.ProductDTO;

public interface ListDAO {

	//리스트 가져오기
	List<ProductDTO> citrusList();
}
