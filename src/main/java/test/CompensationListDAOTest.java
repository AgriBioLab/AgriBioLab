package test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	}

	@Test
	public void 전체_목록_조건_검색() throws SQLException, ParseException {	
		String testAppId = "REQ-2026-000152";
		String startDate = "2026-09-01";
		String endDate = "2026-12-01";
		Date toStartDate = Date.valueOf(startDate);
		Date toEndDate = Date.valueOf(endDate);
		
		List<CompensationListVO> list = dao.searchCompensationList(startDate, endDate, testAppId, null, null, null, null);

		assertNotNull(list);
		assertFalse(list.isEmpty());
		
		for (CompensationListVO vo : list) {
			assertNotNull(vo.getPaymentCompletionDate());
			assertEquals(testAppId, vo.getAppId());
			assertFalse(vo.getPaymentCompletionDate().before(toStartDate));
			assertFalse(vo.getPaymentCompletionDate().after(toEndDate));
		}
	}

	@Test
	public void 보상금_지급일_시작일만_입력_검색() throws ParseException {
		String startDate = "2026-09-01";
		Date toStartDate = Date.valueOf(startDate);

		List<CompensationListVO> list = dao.searchCompensationList(startDate, null, null, null, null, null, null);

		assertNotNull(list);
		assertFalse(list.isEmpty());

		for (CompensationListVO vo : list) {
			assertNotNull(vo.getPaymentCompletionDate());
			assertFalse(vo.getPaymentCompletionDate().before(toStartDate));
		}
	}

	@Test
	public void 보상금_지급일_종료일만_입력_검색() throws ParseException {
		String endDate = "2026-10-01";
		Date toEndDate = Date.valueOf(endDate);

		List<CompensationListVO> list = dao.searchCompensationList(null, endDate, null, null, null, null, null);

		assertNotNull(list);
		assertFalse(list.isEmpty());

		for (CompensationListVO vo : list) {
			assertNotNull(vo.getPaymentCompletionDate());
			assertFalse(vo.getPaymentCompletionDate().after(toEndDate));
		}
	}

	@Test
	public void 대표자명_입력_검색() {
		List<CompensationListVO> list = dao.searchCompensationList(null, null, null, null, "김민아", null, null);

		assertNotNull(list);
		assertFalse(list.isEmpty());
		for (CompensationListVO vo : list) {
			assertNotNull(vo.getRepresentativeName());
			assertEquals("김*아", vo.getRepresentativeName());
		}
	}
	
	@Test
	public void 피해신청번호_입력_검색() {
		String testAppId = "REQ-2026-000152";
		List<CompensationListVO> list = dao.searchCompensationList(null, null, testAppId, null, null, null, null);

		assertNotNull(list);
		assertFalse(list.isEmpty());
		for (CompensationListVO vo : list) {
			assertNotNull(vo.getAppId());
			assertEquals(testAppId, vo.getAppId());
		}
	}
	
	@Test
	public void 품목명_입력_검색() {
		String testProductName = "사과";
		List<CompensationListVO> list = dao.searchCompensationList(null, null, null, null, null, null, testProductName);

		assertNotNull(list);
		assertFalse(list.isEmpty());
		for (CompensationListVO vo : list) {
			assertNotNull(vo.getProductName());
			assertEquals(testProductName, vo.getProductName());
		}
	}
	
	@Test
	public void 구분_입력_검색() {
		String testAppCategory = "생산자";
		List<CompensationListVO> list = dao.searchCompensationList(null, null, null, null, null, testAppCategory, null);

		assertNotNull(list);
		assertFalse(list.isEmpty());
		for (CompensationListVO vo : list) {
			assertNotNull(vo.getAppCategory());
			assertEquals(testAppCategory, vo.getAppCategory());
		}
	}
	
	@Test
	public void 검색_결과_없음() {
		List<CompensationListVO> list = dao.searchCompensationList("2999-01-01", null, null, null, null, null, null);

		assertTrue(list.isEmpty());
	}
}
