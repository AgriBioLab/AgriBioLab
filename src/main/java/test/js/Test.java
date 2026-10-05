package test.js;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.junit.After;
import org.junit.Before;

import model.dao.js.CompensationDetailDAO;
import model.vo.js.*;
import util.js.DBCP;

public class Test {

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

	@org.junit.Test
	public void 보상_신청_정보_조회_성공() {
		String appId = "REQ-2026-000134";
		CompensationClaimVO vo = dao.getCompensationClaim(appId);

		assertNotNull(vo);
		assertEquals(7700000, vo.getCompensationClaimAmount());
		assertEquals(2800, vo.getCompensationClaimArea());
	}

	@org.junit.Test
	public void 보상_신청_정보_조회_결과_없음() {
		String appId = "nnnnn";
		CompensationClaimVO vo = dao.getCompensationClaim(appId);

		assertNull(vo);
	}

	@org.junit.Test
	public void 현장조사_결과_요약_조회() {
		String appId = "REQ-2026-000134";
		InvestigationSummaryVO vo = dao.getDamageInvestigationSummary(appId);

		assertNotNull(vo);
		assertEquals("2026-09-26 00:00:00", vo.getInvestDate());
		assertEquals(65, vo.getDamageRate());
	}

	@org.junit.Test
	public void 현장조사_결과_요약_없음() {
		String appId = "nnnnn";
		InvestigationSummaryVO vo = dao.getDamageInvestigationSummary(appId);

		assertNull(vo);
	}

	@org.junit.Test
	public void 피해신청_문서_조회() {
		String appId = "REQ-2026-000136";
		List<DocumentVO>  vos = dao.getApplicationDocuments(appId);

		assertTrue(!vos.isEmpty());
		assertEquals("피해신청서", vos.get(0).getDocName());
	}
	
	@org.junit.Test
	public void 피해신청_문서_조회_없음() {
		String appId = "nnnnn";
		List<DocumentVO>  vos = dao.getApplicationDocuments(appId);

		assertTrue(vos.isEmpty());
	}

}
