package test.pgt;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import model.dao.pgt.CompensationDetailDAO;
import model.vo.pgt.CompensationClaimDocumentVO;
import model.vo.pgt.CompensationDetailSummaryVO;
import model.vo.pgt.CompensationDocumentVO;
import model.vo.pgt.DamageActionSummaryVO;
import model.vo.pgt.DocumentVO;

public class CompensationDetailDAOTest {
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
	public void 상세_상단_요약_조회() throws SQLException {			
		String applicationId = "REQ-2026-000136";
		CompensationDetailDAO dao = new CompensationDetailDAO(conn);

		CompensationDetailSummaryVO vo = dao.getCompensationDetail(applicationId);
		assertNotNull(vo);
		assertEquals(vo.getApplicationId(), applicationId);
	}
	
	@Test
	public void 조치수행결과_요약_조회() throws SQLException {			
		String applicationId = "REQ-2026-000136";
		String actionType = "폐기";
		String actionContent = "피해 과실 전량 수거 후 매몰 폐기";
		CompensationDetailDAO dao = new CompensationDetailDAO(conn);

		DamageActionSummaryVO vo = dao.getDamageActionSummary(applicationId);
		assertNotNull(vo);
		assertEquals(vo.getActionType(), actionType);
		assertEquals(vo.getPlanActionContent(), actionContent);
	}
	
	@Test
	public void 보상금_산정결과_문서_조회() throws SQLException {			
		int compensationClaimId = 2;
		String documentName = "보상금 산정 내역서";
		String fileURL = "/uploads/calculation/1/calculation.pdf";
		CompensationDetailDAO dao = new CompensationDetailDAO(conn);

		List<DocumentVO> list = dao.getInvestigationDocuments(compensationClaimId);
		
		assertNotNull(list);
	    assertFalse(list.isEmpty());
	    
	    for(DocumentVO vo : list) {
	    	assertEquals(vo.getDocumentName(), documentName);
	    	assertEquals(vo.getFileURL(), fileURL);
	    }
	}
	
	@Test
	public void 보상신청_문서_조회() throws SQLException {			
		int compensationClaimId = 2;
		String documentName1 = "통장 사본";
		String fileURL1 = "/uploads/compensation/2/account.pdf";
		String documentName2 = "보상금 지급 요청서";
		String fileURL2 = "/uploads/compensation/2/payment_request.pdf";
		CompensationDetailDAO dao = new CompensationDetailDAO(conn);

		List<CompensationClaimDocumentVO> list = dao.getCompensationClaimDocuments(compensationClaimId);
		
		assertNotNull(list);
	    assertFalse(list.isEmpty());
	    
	    assertEquals(list.get(0).getDocumentName(), documentName1);
	    assertEquals(list.get(0).getFileURL(), fileURL1);

	    assertEquals(list.get(1).getDocumentName(), documentName2);
	    assertEquals(list.get(1).getFileURL(), fileURL2);
	}
	
	
	
	
}
