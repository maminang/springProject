package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.MessageDAO;
import kr.co.dao.UserDAO;
import kr.co.domain.MessageVO;
import kr.co.domain.UserVO;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

	@Inject
	private MessageDAO mDAO;
	@Inject
	private UserDAO uDAO;

	@Override
	public void create(MessageVO vo) {

		mDAO.create(vo);
		UserVO userVO = new UserVO(vo.getSender(), null, null, 10);
		uDAO.updatePoint(userVO);
	}

	@Override
	public MessageVO readMessage(int mid, String userId) {
		mDAO.updateState(mid);

		UserVO vo = new UserVO(userId, null, null, 5);
		uDAO.updatePoint(vo);

		return mDAO.readMessage(mid);
	}

	@Override
	public void updateState(int mid) {
		// TODO Auto-generated method stub

	}

}
