package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.BoardVO;
import kr.co.domain.Criteria;
import kr.co.domain.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;
	private final String NS = "kr.co.mapper.board";

	private Integer crtBno() {
		return sqlSession.selectOne(NS + ".crtBno");
	}

	@Override
	public List<BoardVO> list() {
		return sqlSession.selectList(NS + ".list");
	}

	@Override
	public BoardVO selectByBno(int bno) {
		return sqlSession.selectOne(NS + ".selectByBno", bno);
	}

	@Override
	public void insert(BoardVO vo) {
		Integer bno = crtBno();
		if (bno == null) {
			bno = 1;
		} else {
			bno++;
		}
		vo.setBno(bno);
		sqlSession.insert(NS + ".insert", vo);
	}

	@Override
	public void update(BoardVO vo) {
		sqlSession.update(NS + ".update", vo);
	}

	@Override
	public void delete(int bno) {
		sqlSession.delete(NS + ".delete", bno);
	}
	
	@Override
	public BoardVO read(int bno) {
		return selectByBno(bno);
	}

	@Override
	public List<BoardVO> listPage(Criteria cri) {
		RowBounds rb = new RowBounds(cri.getStartNum(), cri.getPerPage());
		return sqlSession.selectList(NS + ".list", 0, rb);
	}

	@Override
	public int getAmount() {
		return sqlSession.selectOne(NS + ".amount");
	}

	@Override
	public List<BoardVO> search(SearchCriteria cri) {
		RowBounds rb = new RowBounds(cri.getStartNum(), cri.getPerPage());
		return sqlSession.selectList(NS + ".search", cri, rb);
	}

	@Override
	public int getSearchAmount(SearchCriteria cri) {
		return sqlSession.selectOne(NS + ".getSearchAmount", cri);
	}

	@Override
	public void incrViewCnt(int bno) {
		sqlSession.update(NS + ".incrViewCnt", bno);
	}

	@Override
	public void addAttach(String fullName, int bno) {
		int id = getId();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fullName", fullName);
		map.put("bno", bno);
		map.put("id", id);
		sqlSession.insert(NS + ".addAttach", map);
	}

	private int getId() {
		Integer id = sqlSession.selectOne(NS + ".getId");
		if (id == null) {
			id = 0;
		}

		return ++id;
	}

	@Override
	public void deleteAttach(String fileName, int bno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("bno", bno);
		System.out.println(map);
		sqlSession.delete(NS+".deleteAttach", map);
	}

	@Override
	public void deleteAllAttach(int bno) {
		sqlSession.delete(NS+".deleteAllAttach", bno);
	}
}
