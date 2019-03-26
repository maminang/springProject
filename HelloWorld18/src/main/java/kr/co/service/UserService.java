package kr.co.service;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;

public interface UserService {
	UserVO login(LoginDTO dto);
}
