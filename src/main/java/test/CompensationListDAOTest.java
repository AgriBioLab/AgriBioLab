package test;

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
	public void 피해신청번호_필터_검색() throws SQLException {			
		String appId = "REQ-2026-000136";
		
		assertNotNull(dao.getCompensationListByAppId(appId));
		assertEquals(dao.getCompensationListByAppId(appId).getAppId(), appId);
	}
	
	@Test
	public void 구분_필터_검색() throws SQLException {			
		String appCategory = "생산자";
		
		List<CompensationListVO> list = dao.getCompensationListByAppCategory(appCategory);
		
		assertNotNull(list);
	    assertFalse(list.isEmpty());
		
		for(CompensationListVO vo : list) {
			assertEquals(vo.getAppCategory(), appCategory);
		}
	}
	
	@Test
	public void 단체_상호명_필터_검색() throws SQLException {			
		String organizationName = "행복농장";
		
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
		
		List<CompensationListVO> list = dao.getCompensationListByPaymentCompletionDate(startDate, endDate);
						
		assertNotNull(list);
	    assertFalse(list.isEmpty());
		
		for(CompensationListVO vo : list) {			
			assertTrue(!vo.getPaymentCompletionDate().before(Date.valueOf(startDate)));
		    assertTrue(!vo.getPaymentCompletionDate().after(Date.valueOf(endDate)));
		}
		
	}

}
