package test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import model.dao.CompensationListDAO;
import model.vo.CompensationListVO;

public class CompensationListDAOTest {
	private static Connection conn;
	private static CompensationListDAO dao;

	@BeforeClass
	public static void before() throws SQLException {
		conn = util.DBCP.getConnection();
		dao = new CompensationListDAO(conn);
	}
	
	@AfterClass
	public static void after() throws SQLException {
	    if (conn != null) {
	        conn.close();
	    }
	}
	
	@Test
	public void 전체_목록_검색() throws SQLException {			
		List<CompensationListVO> list = dao.getCompensationList();
		
		assertNotNull(list);
	    assertFalse(list.isEmpty());

	    assertTrue(list.size() > 0);
	}
	
	@Test
	public void 전체_목록_조건_검색() throws SQLException {			
		List<CompensationListVO> list = dao.searchCompensationList("2026-09-01", "2026-09-30", "REQ-2026-000137", null, null, null, null);
		
		assertNotNull(list);
	    assertFalse(list.isEmpty());

	    System.out.println(list);
	    assertTrue(list.size() > 0);
	}


}
