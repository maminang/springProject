package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.domain.Criteria;
import kr.co.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	@Inject
	private SqlSession session;
	private final String NS = "kr.co.mapper.reply";

	@Override
	public void insert(ReplyVO vo) {
		Integer rno = crtRno();
		if (rno == null) {
			rno = 1;
		} else {
			rno++;
		}
		vo.setRno(rno);
		session.insert(NS + ".insert", vo);
	}

	private Integer crtRno() {
		return session.selectOne(NS + ".crtRno");
	}

	@Override
	public List<ReplyVO> list(int bno, Criteria cri) {
		RowBounds rb = new RowBounds(cri.getStartNum(), cri.getPerPage());
		return session.selectList(NS + ".list", bno, rb);
	}

	@Override
	public void update(ReplyVO vo) {
		session.update(NS + ".update", vo);
	}

	@Override
	public void delete(int rno) {
		session.delete(NS + ".delete", rno);
	}

	@Override
	public int getAmount(int bno) {
		Integer amount = session.selectOne(NS + ".getAmount", bno);
		if (amount == null) {
			return 0;
		} else {
			return amount;
		}
	}

	@Override
	public Boolean checkID(String inputID) {
		Integer result = session.selectOne(NS + ".checkID", inputID);
		if (result != null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public void deleteByBno(int bno) {
		session.delete(NS + ".deleteByBno", bno);
	}

	@Override
	public List<String> getAttach(Integer bno) {
		return session.selectList(NS+".getAttach", bno);
	}

}
