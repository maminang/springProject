package kr.ca.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ca.dao.MainDAO;
import kr.ca.domain.FooterInfoDTO;
import kr.ca.domain.MenuDTO;

@Service
@Transactional
public class MainServiceImpl implements MainService{

	@Inject
	private MainDAO dao;
	
	public List<MenuDTO> getMenu() {
		return dao.getMenu();
	}

	@Override
	public FooterInfoDTO getFooterInfo() {
		return dao.getFooterInfo();
	}

}
