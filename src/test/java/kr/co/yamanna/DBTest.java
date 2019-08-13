package kr.co.yamanna;

import static org.junit.Assert.assertNotNull;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/*.xml"})
public class DBTest {

	@Autowired
	private DataSource ds;
	
	@Autowired
	private SqlSessionTemplate session;
	
	@Test
	public void DBtest() throws Exception {
		System.out.println("ds : " + ds);
		assertNotNull(ds);
	}
	
	@Test
	public void Select() throws Exception {
		session.insert("kr.co.yamanna.dao.MemberDAO.insertUserInfo","uname");
	}
}
