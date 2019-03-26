package kr.co.dao;

import kr.co.domain.MessageVO;

public interface MessageDAO {
	void create(MessageVO vo);
	MessageVO readMessage(int mid);
	void updateState(int mid);
}
