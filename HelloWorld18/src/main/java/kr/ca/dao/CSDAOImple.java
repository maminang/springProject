package kr.ca.dao;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.ca.domain.CSDTO;
import kr.ca.domain.Criteria;
import kr.ca.domain.SearchCriteria;

//현재 클래스를 dao bean으로 등록시킴
@Repository//서버가 startup될 때 이 클래스가 메모리에 자동으로 등록됨
public class CSDAOImple implements CSDAO{

	//Import 대상 org.slf4j.Logger
	//로깅 처리를 위한 객체 선언
	//private static final Logger logger= LoggerFactory.getLogger(CSDAOImple.class);
	
	
	//SqlSession 객체를 스프링에서 생성하여 주입시켜 줌
	//의존 관계 주입(Dependency Injection, DI)
	//느슨한 결합
	//IoC(Inversion of Control, 제어의 역전)
	@Inject
	private SqlSession session;//이름은 동일하게 session이지만 jsp의 세션과는 다르다
	private final String NS="kr.ca.mapper.CSMapper";//매퍼 네임스페이스에 있는거 복사해오기
	
	
	// commit(), close() 할 필요가 없음.
	@Override
	public List<CSDTO> list() {
		// TODO Auto-generated method stub
		
		//sql mapper에 작성된 sql 코드가 실행됨(auto commit & close)
		return session.selectList(NS+".list");
		
	}


	@Override
	public int getAmount() {
		
		return session.selectOne(NS+".getAmount");
	}
	
	@Override
	public List<CSDTO> listPage(Criteria cri){
		
		RowBounds rb = new RowBounds(cri.getStartNum()-1, cri.getPerPage()); /* 1번부터 시작해서 10개 */
	
		
		return session.selectList(NS+".list", 0, rb);
		//파라미터값 cri.getStartNum()-1로 하지 않으면 맨 마지막에 쓴 글이 표시되지 않는다.
	}


	//글쓰기
	@Override
	//insert user_question
	public void insert(CSDTO vo) {
		// TODO Auto-generated method stub
		Integer bno=createBno();
		if(bno==null) {
			bno=1;
		}else {
			bno++;
		}
		vo.setBno(bno);
		
		session.insert(NS+".insert",vo);
	}
	//글번호 입력하지 않아도 자동으로 생성(db에서 존재하는 가장 큰 idnbr 불러와서 +1)
	//get IndexNbr from tbl_faq
	private Integer createBno() {
		return session.selectOne(NS+".createBno");
	}
	
	


	//글 읽기
	@Override
	public CSDTO read(int bno) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".read",bno);
	}

	
	//글삭제 권한 검증
	@Override
	public CSDTO deleteui(int bno) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".deleteui",bno);
	}

	//글수정화면
	@Override
	public CSDTO updateUI(int bno) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".updateUI",bno);
	}
	
	@Override
	public CSDTO answerui(int bno) {
		return session.selectOne(NS+".answerui", bno);
		
	}
	
	
	
	//글수정
	@Override
	public void update(CSDTO vo) {
		// TODO Auto-generated method stub
		session.update(NS+".update", vo);
	}

	@Override
	public void answer(CSDTO vo) {
		// TODO Auto-generated method stub
		session.update(NS+".answer", vo);
	}
	
	//글삭제
	@Override
	public void delete(CSDTO vo) {
		// TODO Auto-generated method stub
		session.delete(NS+".delete",vo);
	}

	//검색
	@Override
	public List<CSDTO> search(SearchCriteria cri) {
		// TODO Auto-generated method stub
		RowBounds rb=new RowBounds(cri.getStartNum()-1,cri.getPerPage());
		return session.selectList(NS+".search",cri,rb);
	}

	//검색 결과 나열
	@Override
	public int getSearchAmount(SearchCriteria cri) {
		// TODO Auto-generated method stub
		return session.selectOne(NS+".getSearchAmount",cri);
	}

	//질문 삭제
	@Override
	public void delete(int bno) {
		// TODO Auto-generated method stub
		session.delete(NS+".delete",bno);
	}

	//첨부파일
	@Override
	public void addAttach(String fullName, int bno) {
		// TODO Auto-generated method stub
		int id = getId();
		/*
		 * Map<String, Object> map = new HashMap<String,Object>(); map.put("fullName",
		 * fullName); map.put("bno", bno); map.put("id", id);
		 */
		
		/* session.insert(NS+".addAttach",map); */
	}
	
	private int getId() {
		Integer id=session.selectOne(NS+".getId");
		if(id==null) {
			id=0;
		}
		return ++id;
	}

	//첨부파일 삭제
	@Override
	public void deleteAttach(String fileName, int bno) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("fileName", fileName);
		map.put("bno",bno);
		session.delete(NS+".deleteAttach", map);
	}


	@Override
	public void deleteAllAttach(int bno) {
		// TODO Auto-generated method stub
		session.delete(NS+".deleteAllAttach", bno);
	}


	


	


	


	


	



	
	

}
