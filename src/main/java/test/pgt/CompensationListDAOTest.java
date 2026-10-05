package test.pgt;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import model.dao.pgt.CompensationListDAO;
import model.vo.pgt.CompensationListVO;

public class CompensationListDAOTest {
	private static Connection conn;

	@BeforeClass
	public static void before() throws SQLException {
		conn=util.DBCP.getConnection();
	}
	
	@AfterClass
	public static void after() throws SQLException {
	    if (conn != null) {
	        conn.close();
	    }
	}
	
	@Test
	public void 피해신청번호_필터_검색() throws SQLException {			
		String applicationId = "REQ-2026-000136";
		CompensationListDAO dao = new CompensationListDAO(conn);
		
		assertNotNull(dao.getCompensationListByApplicationId(applicationId));
		assertEquals(dao.getCompensationListByApplicationId(applicationId).getApplicationId(), applicationId);
	}
	
	@Test
	public void 구분_필터_검색() throws SQLException {			
		String applicationCategory = "생산자";
		CompensationListDAO dao = new CompensationListDAO(conn);
		
		List<CompensationListVO> list = dao.getCompensationListByApplicationCategory(applicationCategory);
		
		assertNotNull(list);
	    assertFalse(list.isEmpty());
		
		for(CompensationListVO vo : list) {
			assertEquals(vo.getApplicationCategory(), applicationCategory);
		}
	}
	
	@Test
	public void 단체_상호명_필터_검색() throws SQLException {			
		String organizationName = "행복농장";
		CompensationListDAO dao = new CompensationListDAO(conn);		
		
		List<CompensationListVO> list = dao.getCompensationListByOrganizationName(organizationName);
				
		assertNotNull(list);
	    assertFalse(list.isEmpty());
		
		for(CompensationListVO vo : list) {
			assertEquals(vo.getOrganizationName(), organizationName);
		}
	}
	
	@Test
	public void 대표자_필터_검색() throws SQLException {			
		String representativeName = "최현우";
		CompensationListDAO dao = new CompensationListDAO(conn);		
		
		List<CompensationListVO> list = dao.getCompensationListByRepresentativeName(representativeName);
		
		assertNotNull(list);
	    assertFalse(list.isEmpty());
		
		for(CompensationListVO vo : list) {
			assertEquals(vo.getRepresentativeName(), representativeName);
		}
	}
	
	@Test
	public void 품목명_필터_검색() throws SQLException {			
		String productName = "사과";
		CompensationListDAO dao = new CompensationListDAO(conn);		
		
		List<CompensationListVO> list = dao.getCompensationListByProductName(productName);
		
		assertNotNull(list);
	    assertFalse(list.isEmpty());
		
		for(CompensationListVO vo : list) {
			assertEquals(vo.getProductName(), productName);
		}
	}
	
	@Test
	public void 보상지급일_필터_검색() throws SQLException {			
		String startDate = "2026-09-01";
		String endDate = "2026-09-30";
//		String endDate = "2026-09-29"; // 실패 케이스

		CompensationListDAO dao = new CompensationListDAO(conn);	
		
		List<CompensationListVO> list = dao.getCompensationListByPaymentCompletionDate(startDate, endDate);
						
		assertNotNull(list);
	    assertFalse(list.isEmpty());
		
		for(CompensationListVO vo : list) {			
			assertTrue(!vo.getPaymentCompletionDate().before(Date.valueOf(startDate)));
		    assertTrue(!vo.getPaymentCompletionDate().after(Date.valueOf(endDate)));
		}
		
	}

}
