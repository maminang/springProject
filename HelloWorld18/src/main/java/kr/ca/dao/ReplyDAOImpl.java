package kr.ca.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.Criteria;
import kr.ca.domain.ReplyVO;
@Repository
public class ReplyDAOImpl implements ReplyDAO{
	@Inject//@Autowired와 @Inject의 차이는? 
	private SqlSession session;
	private final String NS="kr.ca.mapper.reply";
	
	
	@Override
	public void insert(ReplyVO vo) {
		int rno = createRno();
		vo.setRno(rno);
		session.insert(NS+".insert",vo);
	}


	private Integer createRno() {
		Integer rno= session.selectOne(NS+".createRno");
		if(rno==null) {
			rno=1;
		}else {
			rno++;
		}
		return rno;
	}


	@Override
	public List<ReplyVO> list(int idnbr) {
		
		return session.selectList(NS+".list",idnbr);
	}


	@Override
	public void update(ReplyVO vo) {
		// TODO Auto-generated method stub
		session.update(NS+".update",vo);
	}


	@Override
	public void delete(int rno) {
		// TODO Auto-generated method stub
		session.delete(NS+".delete", rno);
	}


	@Override
	public int getAmount(Integer bno) {
		// TODO Auto-generated method stub
		Integer amount = session.selectOne(NS+".getAmount", bno);//null값이 나올 수도 있기 때문에 자료형 int 사용하면 안된다.
		if(amount==null) {
			return 0;
		}
		return amount;
	}


	@Override
	public List<ReplyVO> list(int idnbr, int page) {
		// TODO Auto-generated method stub
		Criteria cri=new Criteria(page, 10);
		RowBounds rb=new RowBounds(cri.getStartNum()-1,cri.getPerPage());
		return session.selectList(NS+".list", idnbr, rb);
	}


	@Override
	public void deleteByBno(int bno) {
		// TODO Auto-generated method stub
		session.delete(NS+".deleteByBno",bno);
	}


	@Override
	public List<String> getAttach(Integer bno) {
		// TODO Auto-generated method stub
		return session.selectList(NS+".getAttach",bno);
	}
	


	

}
