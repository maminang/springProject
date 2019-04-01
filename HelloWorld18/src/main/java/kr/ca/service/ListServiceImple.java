package kr.ca.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ca.dao.ListDAO;
import kr.ca.domain.ProductDTO;

@Service
@Transactional
public class ListServiceImple implements ListService{
	
	@Inject
	private ListDAO dao;
	
	@Override
	public List<ProductDTO> citrusList(){
		return dao.citrusList();
	}
}
