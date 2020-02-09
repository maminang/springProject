package kr.ca.dao;



import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.CSDTO;
import kr.ca.domain.Criteria;


@Repository
public class CSDAOImple implements CSDAO{

	@Inject
	private SqlSession session;//이름은 동일하게 session이지만 jsp의 세션과는 다르다
	private final String NS="kr.co.mapper.CSMapper";//매퍼 네임스페이스에 있는거 복사해오기
	
	
	@Override
	public List<CSDTO> csList() {
		// TODO Auto-generated method stub
		
		return session.selectList(NS+".csList");
		
	}


	@Override
	public int getAmount() {
		
		return session.selectOne(NS+".getAmount");
	}
	
	@Override
	public List<CSDTO> listPage(Criteria cri){
		
		RowBounds rb = new RowBounds(cri.getStartNum()-1, cri.getPerPage()); /* 1번부터 시작해서 10개 */
	
		
		return session.selectList(NS+".csList", 0, rb);
		//파라미터값 cri.getStartNum()-1로 하지 않으면 맨 마지막에 쓴 글이 표시되지 않는다.
	}
	
	

}
