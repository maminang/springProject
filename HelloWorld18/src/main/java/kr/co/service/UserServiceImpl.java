package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.UserDAO;
import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	@Override
	public UserVO login(LoginDTO dto) {
		return dao.login(dto);
	}

}
