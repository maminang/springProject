package kr.co.service;

import kr.co.domain.MessageVO;

public interface MessageService {

	void create(MessageVO vo);

	MessageVO readMessage(int mid, String userId);

	void updateState(int mid);
}
