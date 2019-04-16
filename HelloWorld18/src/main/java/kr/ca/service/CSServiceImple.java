package kr.ca.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ca.dao.CSDAO;
import kr.ca.dao.ReplyDAO;
import kr.ca.domain.CSDTO;
import kr.ca.domain.Criteria;
import kr.ca.domain.SearchCriteria;

@Service
@Transactional
public class CSServiceImple implements CSService {
	@Inject
	private CSDAO dao;

	@Inject
	private ReplyDAO rdao;

	// 리스트 보여주기
	@Override
	public List<CSDTO> csList() {

		return dao.list();
	}

	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return dao.getAmount();
	}

	@Override
	public List<CSDTO> listPage(Criteria cri) {
		// TODO Auto-generated method stub

		return dao.listPage(cri);
	}

	// 글읽기
	@Override
	public CSDTO read(int bno) {
		// TODO Auto-generated method stub
		// 조회수 증가 코드-필요시 db 수정 필요.
		// dao.incrViewCnt(bno);
		return dao.read(bno);
	}

	
	
	

	// 답글
	@Override
	public CSDTO answerui(int bno) {
		// TODO Auto-generated method stub

		return dao.answerui(bno);
	}

	@Override
	public CSDTO deleteui(int bno) {
		// TODO Auto-generated method stub
		return dao.deleteui(bno);
	}
	
	// 글수정
	@Override
	public CSDTO updateUI(int bno) {
		// TODO Auto-generated method stub
		return dao.updateUI(bno);
	}
	
	@Override
	public void update(CSDTO vo) {
		// TODO Auto-generated method stub
		dao.update(vo);
		dao.deleteAllAttach(vo.getBno());
		/* String[] files=vo.getQfile(); */
		String files = vo.getQfile();
		if (files == null) {
			return;
		} else {
			/*
			 * 파일 for(String fullName:files) { dao.addAttach(fullName,vo.getBno()); }
			 */
		}
	}

	@Override
	public void answer(CSDTO vo) {
		// TODO Auto-generated method stub
		dao.answer(vo);
		dao.deleteAllAttach(vo.getBno());
		/* String[] files=vo.getQfile(); */
		String files = vo.getQfile();
		if (files == null) {
			return;
		} else {
			/*
			 * 파일 for(String fullName:files) { dao.addAttach(fullName,vo.getBno()); }
			 */
		}
	}

	@Override
	public void delete(CSDTO vo) {
		// TODO Auto-generated method stub

		dao.delete(vo);
	}

	@Override
	public List<CSDTO> search(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.search(cri);
	}

	@Override
	public int getSearchAmount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return dao.getSearchAmount(cri);
	}

	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		rdao.deleteByBno(bno);
		dao.deleteAllAttach(bno);
		dao.delete(bno);
		// 원글을 지우기 전에 bno를 참조하는 댓글들을 전부 지움. 코드 순서 중요 dao.delete(bno)보다 위에 위치해야 한다.

	}

	@Override
	public List<String> getAttach(Integer bno) {

		return rdao.getAttach(bno);
	}

	@Override
	public void deleteAttach(String fileName, int bno) {
		// TODO Auto-generated method stub
		dao.deleteAttach(fileName, bno);
	}

	@Override
	public void insert(CSDTO vo) {
		// TODO Auto-generated method stub
		dao.insert(vo);
		/* 파일 String[] files=vo.getQfile(); */
		String files = vo.getQfile();
		
		if (files == null) {
			return;
		}

		dao.addAttach(files, vo.getBno());

	}
	/*
	 * 파일 for(int i=0;i<files.length;i++) { dao.addAttach(files[i],vo.getBno()); }
	 */

	

	
}
