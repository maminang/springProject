package kr.ca.dao;

import java.util.List;

import kr.ca.domain.FooterInfoDTO;
import kr.ca.domain.MenuDTO;

public interface MainDAO {

	List<MenuDTO> getMenu();

	FooterInfoDTO getFooterInfo();

}
