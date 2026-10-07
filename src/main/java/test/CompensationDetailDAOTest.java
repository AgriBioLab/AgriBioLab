package test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import model.dao.CompensationDetailDAO;
import model.vo.DamageApplicationVO;
import model.vo.CompensationCalcVO;
import model.vo.CompensationClaimDocumentVO;
import model.vo.CompensationSummaryVO;
import model.vo.CompensationPaymentVO;
import model.vo.CompensationProgressVO;
import model.vo.DamageActionSummaryVO;
import model.vo.DocumentsVO;
import model.vo.CompensationClaimVO;
import model.vo.InvestigationSummaryVO;

public class CompensationDetailDAOTest {
	private static Connection conn;
	private static CompensationDetailDAO dao;

	@BeforeClass
	public static void before() throws SQLException {
		conn = util.DBCP.getConnection();
		dao = new CompensationDetailDAO(conn);
	}
	
	@AfterClass
	public static void after() throws SQLException {
	    if (conn != null) {
	        conn.close();
	    }
	}
	
	@Test
	public void 상세_상단_요약_조회_성공() throws SQLException {			
		String applicationId = "REQ-2026-000136";

		CompensationSummaryVO vo = dao.getCompensationSummary(applicationId);
		assertNotNull(vo);
		assertEquals(vo.getApplicationId(), applicationId);
	}
	
	@Test
	public void 조치수행결과_요약_조회_성공() throws SQLException {			
		String applicationId = "REQ-2026-000136";
		String actionType = "폐기";
		String actionContent = "피해 과실 전량 수거 후 매몰 폐기";

		DamageActionSummaryVO vo = dao.getDamageActionSummary(applicationId);
		assertNotNull(vo);
		assertEquals(vo.getActionType(), actionType);
		assertEquals(vo.getPlanActionContent(), actionContent);
	}
	
	@Test
	public void 보상금_산정결과_문서_조회_성공() throws SQLException {			
		int compensationClaimId = 2;
		String documentName1 = "보상금 산정 내역서";
		String fileURL1 = "/uploads/calculation/1/calculation.pdf";
		
		String documentName2 = "산정 근거 확인서";
		String fileURL2 = "/uploads/calculation/1/basis.pdf";

		List<DocumentsVO> list = dao.getInvestigationDocuments(compensationClaimId);		
		
		assertNotNull(list);
	    assertFalse(list.isEmpty());
	    
	    assertEquals(list.get(0).getDocName(), documentName1);
    	assertEquals(list.get(0).getFileUrl(), fileURL1);
    	assertEquals(list.get(1).getDocName(), documentName2);
    	assertEquals(list.get(1).getFileUrl(), fileURL2);
	}
	
	@Test
	public void 보상신청_문서_조회_성공() throws SQLException {			
		int compensationClaimId = 2;
		String documentName1 = "통장 사본";
		String fileURL1 = "/uploads/compensation/2/account.pdf";
		String documentName2 = "보상금 지급 요청서";
		String fileURL2 = "/uploads/compensation/2/payment_request.pdf";

		List<CompensationClaimDocumentVO> list = dao.getCompensationClaimDocuments(compensationClaimId);
		
		assertNotNull(list);
	    assertFalse(list.isEmpty());
	    
	    assertEquals(list.get(0).getDocumentName(), documentName1);
	    assertEquals(list.get(0).getFileURL(), fileURL1);

	    assertEquals(list.get(1).getDocumentName(), documentName2);
	    assertEquals(list.get(1).getFileURL(), fileURL2);
	}
	
	@Test
	public void 피해신청_접수_정보_조회_성공() {
		String testAppId = "REQ-2026-000131";
		DamageApplicationVO vo = dao.getDamageApplication(testAppId);
		assertNotNull(vo);
		assertEquals(testAppId, vo.getAppId());
	}

	@Test
	public void 피해신청_접수_정보_조회_없는_경우() {
		assertNull(dao.getDamageApplication("nnnn"));
	}

	@Test
	public void 보상금_산정_정보_조회_성공() {
		int testClaimId = 2;
		CompensationCalcVO vo = dao.getCompensationCalc(testClaimId);
		assertNotNull(vo);
		assertEquals(6720000, vo.getFinalCompensationAmount());
		assertEquals(7000, vo.getCriterionUnitPrice());
	}

	@Test
	public void 보상금_산정_정보_조회_없는_경우() {
		assertNull(dao.getCompensationCalc(99999));
	}

	@Test
	public void 보산금_지급_처리_결과_조회_성공() {
		int testClaimId = 2;
		CompensationPaymentVO vo = dao.getCompensationPayment(testClaimId);
		assertNotNull(vo);
		assertEquals("한소영", vo.getPaymentChargerName());
	}

	@Test
	public void 보상금_지급_처리_결과_없는_경우() {
		assertNull(dao.getCompensationPayment(99999));
	}

	@Test
	public void 보상금_지급_결과_문서_조회_1건_이상() {
		List<DocumentsVO> list = dao.getCompensationPaymentDocuments(2);
		assertNotNull(list);
		assertEquals("지급 결정 통지서", list.get(0).getDocName());
	}

	@Test
	public void 보상금_지급_결과_문서_조회_없는_경우() {
		assertTrue(dao.getCompensationPaymentDocuments(99999).isEmpty());
	}

	@Test
	public void 피해신청부터_지급결과까지_전체_흐름_조회_성공() {
		String testAppId = "REQ-2026-000133";
		CompensationProgressVO vo = dao.getCompensationProgress(testAppId);
		assertNotNull(vo);
		assertEquals("2026-09-22 00:00:00", vo.getAppDate());
		assertEquals("2026-09-25 00:00:00", vo.getInvestDate());
	}

	@Test
	public void 피해신청부터_지급결과까지_전체_흐름_조회_없는_경우() {
		assertNull(dao.getCompensationProgress("nnnn"));
	}
	
	
	@Test
	public void 보상_신청_정보_조회_성공() {
		String appId = "REQ-2026-000134";
		CompensationClaimVO vo = dao.getCompensationClaim(appId);

		assertNotNull(vo);
		assertEquals(7700000, vo.getCompensationClaimAmount());
		assertEquals(2800, vo.getCompensationClaimArea());
	}

	@Test
	public void 보상_신청_정보_조회_결과_없음() {
		String appId = "nnnnn";
		CompensationClaimVO vo = dao.getCompensationClaim(appId);

		assertNull(vo);
	}

	@Test
	public void 현장조사_결과_요약_조회() {
		String appId = "REQ-2026-000134";
		InvestigationSummaryVO vo = dao.getInvestigationSummary(appId);

		assertNotNull(vo);
		assertEquals("2026-09-26 00:00:00", vo.getInvestDate());
		assertEquals(65, vo.getDamageRate());
	}

	@Test
	public void 현장조사_결과_요약_없음() {
		String appId = "nnnnn";
		InvestigationSummaryVO vo = dao.getInvestigationSummary(appId);

		assertNull(vo);
	}

	@Test
	public void 피해신청_문서_조회() {
		String appId = "REQ-2026-000136";
		List<DocumentsVO>  vos = dao.getDamageApplicationDocuments(appId);

		assertTrue(!vos.isEmpty());
		assertEquals("피해신청서", vos.get(0).getDocName());
	}
	
	@Test
	public void 피해신청_문서_조회_없음() {
		String appId = "nnnnn";
		List<DocumentsVO>  vos = dao.getDamageApplicationDocuments(appId);

		assertTrue(vos.isEmpty());
	}
	
	
	
	
}
