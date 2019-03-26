package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.BoardDAO;
import kr.co.dao.ReplyDAO;
import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO bDAO;
	@Inject
	private ReplyDAO rDAO;
	
	@Override
	public List<BoardVO> list() {
		return bDAO.list();
	}

	@Override
	public BoardVO selectByBno(int bno) {
		return bDAO.selectByBno(bno);
	}

	@Override
	public void insert(BoardVO vo) {
		bDAO.insert(vo);
		
		String[] files = vo.getFiles(); 
		if (files == null) {
			return;
		}
		
		for (String fullName:files) {	
			bDAO.addAttach(fullName, vo.getBno());
		}
	}

	@Override
	public void update(BoardVO vo) {
		bDAO.update(vo);
		bDAO.deleteAllAttach(vo.getBno());
		
		String[] files = vo.getFiles(); 
		if (files == null) {
			return;
		}
		
		for (String fullName:files) {	
			bDAO.addAttach(fullName, vo.getBno());
		}
	}

	@Override
	public void delete(int bno) {
		// 원글을 지우기 전에 bno를 참조하는 댓글들을 전부 지움
		rDAO.deleteByBno(bno);
		bDAO.deleteAllAttach(bno);
		bDAO.delete(bno);
	}

	@Override
	public BoardVO read(int bno) {
		bDAO.incrViewCnt(bno);
		return bDAO.read(bno);
	}

	@Override
	public List<BoardVO> listPage(Criteria cri) {
		return bDAO.listPage(cri);
	}

	@Override
	public int getAmount() {
		return bDAO.getAmount();
	}

	@Override
	public List<BoardVO> search(SearchCriteria cri) {
		return bDAO.search(cri);
	}

	@Override
	public int getSearchAmount(SearchCriteria cri) {
		return bDAO.getSearchAmount(cri);
	}

	@Override
	public List<String> getAttach(Integer bno) {
		return rDAO.getAttach(bno);
	}

	@Override
	public void deleteAttach(String fileName, int bno) {
		bDAO.deleteAttach(fileName, bno);
	}

}
