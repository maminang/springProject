package kr.co.ca;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MybatisTest {
	@Autowired
	private SqlSessionFactory sqlFactory;

	@Test
	public void tesrFactory() {
		System.out.println(sqlFactory);
	}

	@Test
	public void testSession() throws Exception {
		SqlSession session = null;
		
		try {
			session = sqlFactory.openSession();
			System.out.println("::::::::::::");
			System.out.println(session);
			System.out.println("::::::::::::");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null) {				
				session.close();
			}
		}
	}
}
