package test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import model.dao.QualityOfficerDAO;

public class QualityOfficerDAOTest {
	private static Connection conn;
	private static QualityOfficerDAO dao;

	@BeforeClass
	public static void before() throws SQLException {
		conn = util.DBCP.getConnection();
		dao = new QualityOfficerDAO(conn);
	}
	
	@AfterClass
	public static void after() throws SQLException {
	    if (conn != null) {
	        conn.close();
	    }
	}
	
	@Test
	public void 로그인_성공() throws SQLException {
		String username = "quality01";
		String password = "quality1234";
		 
		assertNotNull(dao.login(username, password));
		assertEquals(dao.login(username, password).getUsername(), username);
		assertEquals(dao.login(username, password).getPassword(), password);
	}
	
	@Test
	public void 로그인_실패() throws SQLException {
		String username = "quality01";
		String password = "quality123";
		 
		assertNull(dao.login(username, password));
	}


}
