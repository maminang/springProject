package kr.co.dao;

import kr.co.domain.LoginDTO;
import kr.co.domain.UserVO;

public interface UserDAO {
	void updatePoint(UserVO vo);
	
	UserVO login(LoginDTO dto);
}
