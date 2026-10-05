package test.lwg;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import model.dao.lwg.CompensationDetailDAO;
import model.vo.lwg.*;
import util.DBCP;

public class CompensationDetailDAOTest {

	private Connection conn;
	private CompensationDetailDAO dao;

	@Before
	public void before() throws SQLException {
		conn = DBCP.getConnection();
		dao = new CompensationDetailDAO(conn);
	}
	
	@After
	public void after() throws SQLException {
	    if (conn != null) {
	        conn.close();
	    }
	}

	@Test
	public void 피해신청_접수_정보_조회_성공() {
		String testAppId = "REQ-2026-000131";
		ApplicationReceptionVO vo = dao.getApplicationReception(testAppId);
		assertNotNull(vo);
		assertEquals(testAppId, vo.getAppId());
	}

	@Test
	public void 피해신청_접수_정보_조회_없는_경우() {
		assertNull(dao.getApplicationReception("nnnn"));
	}

	@Test
	public void 보상금_산정_정보_조회_성공() {
		int testClaimId = 2;
		CompensationCalculationVO vo = dao.getCompensationCalculation(testClaimId);
		assertNotNull(vo);
		assertEquals(6720000, vo.getFinalCompensationAmount());
		assertEquals(7000, vo.getCriterionUnitPrice());
	}

	@Test
	public void 보상금_산정_정보_조회_없는_경우() {
		assertNull(dao.getCompensationCalculation(99999));
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

}
