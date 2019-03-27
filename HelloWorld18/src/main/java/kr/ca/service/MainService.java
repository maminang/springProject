package kr.ca.service;

import java.util.List;

import kr.ca.domain.FooterInfoDTO;
import kr.ca.domain.MenuDTO;

public interface MainService {

	List<MenuDTO> getMenu();

	FooterInfoDTO getFooterInfo();

}
