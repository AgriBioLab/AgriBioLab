package com.agribiolab.compensation.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;

import com.agribiolab.compensation.vo.AttachmentFileVO;
import com.agribiolab.compensation.vo.CompensationDetailVO;
import com.agribiolab.compensation.vo.CompensationSearchVO;
import com.agribiolab.compensation.vo.CompensationVO;
import com.agribiolab.testsupport.DaoTestSupport;

class CompensationDAOImplTest {
    private final CompensationDAO compensationDAO = new CompensationDAOImpl();

    @Test
    void findCompensationList_returnsPaymentResultColumns() throws SQLException {
        DaoTestSupport.assumeDatabaseConfigured();
        CompensationSearchVO search = new CompensationSearchVO();
        search.setStartDate(LocalDate.of(2026, 9, 1));
        search.setEndDate(LocalDate.of(2026, 9, 30));

        List<CompensationVO> list = compensationDAO.findCompensationList(search);

        assertFalse(list.isEmpty());
        CompensationVO target = findByApplyNo(list, "REQ-2026-000136");
        assertEquals("생산자", target.getTargetTypeName());
        assertEquals("행복농장", target.getBusinessName());
        assertEquals("김*아", target.getOwnerNameMasked());
        assertEquals("사과", target.getItemName());
        assertEquals(0, new BigDecimal("6720000").compareTo(target.getFinalAmount()));
        assertEquals(LocalDate.of(2026, 9, 30), target.getPaymentDate());
        assertEquals("○○도 보상지급기관", target.getPaymentOrgName());
    }

    @Test
    void findCompensationList_filtersByApplyNo() throws SQLException {
        DaoTestSupport.assumeDatabaseConfigured();
        CompensationSearchVO search = new CompensationSearchVO();
        search.setApplyNo("REQ-2026-000136");

        List<CompensationVO> list = compensationDAO.findCompensationList(search);

        assertEquals(1, list.size());
        assertEquals("REQ-2026-000136", list.get(0).getApplyNo());
    }

    @Test
    void findCompensationDetailByApplyNo_includesActionAndSurveySummary() throws SQLException {
        DaoTestSupport.assumeDatabaseConfigured();

        Optional<CompensationDetailVO> result = compensationDAO.findCompensationDetailByApplyNo("REQ-2026-000136");

        assertTrue(result.isPresent());
        CompensationDetailVO detail = result.get();
        assertEquals("REQ-2026-000136", detail.getApplyNo());
        assertEquals("행복농장", detail.getBusinessName());
        assertEquals("김현아", detail.getOwnerName());
        assertEquals("집중호우", detail.getDisasterType());
        assertEquals("사과", detail.getItemName());
        assertEquals(0, new BigDecimal("9590000").compareTo(detail.getRequestAmount()));
        assertEquals(0, new BigDecimal("6720000").compareTo(detail.getFinalAmount()));
        assertEquals("○○도 보상산정기관", detail.getCalculationOrgName());
        assertEquals("○○도 보상지급기관", detail.getPaymentOrgName());
        assertEquals("매몰 폐기", detail.getActionMethod());
        assertEquals(0, new BigDecimal("1200").compareTo(detail.getActualActionQtyKg()));
        assertEquals(LocalDate.of(2026, 9, 25), detail.getResultCheckedAt());
        assertEquals(LocalDate.of(2026, 9, 20), detail.getSurveyCompletedAt());
        assertEquals(Integer.valueOf(2), detail.getFinalSurveyRound());
        assertEquals(0, new BigDecimal("35.5").compareTo(detail.getFinalDamageRate()));
        assertNotNull(detail.getAttachments());
        assertFalse(detail.getAttachments().isEmpty());
    }

    @Test
    void findCompensationAttachments_returnsCompensationDocuments() throws SQLException {
        DaoTestSupport.assumeDatabaseConfigured();

        List<AttachmentFileVO> attachments = compensationDAO.findCompensationAttachments("REQ-2026-000136", "COMP");

        assertFalse(attachments.isEmpty());
        assertTrue(containsDocument(attachments, "통장 사본"));
        assertTrue(containsDocument(attachments, "보상금 지급 요청서"));
        assertTrue(containsDocument(attachments, "보상금 산정 내역서"));
        assertTrue(containsDocument(attachments, "지급 결정 통지서"));
    }

    @Test
    void findCompensationDetailByApplyNo_returnsEmptyForUnknownApplyNo() throws SQLException {
        DaoTestSupport.assumeDatabaseConfigured();

        Optional<CompensationDetailVO> result = compensationDAO.findCompensationDetailByApplyNo("REQ-NOT-FOUND");

        assertTrue(result.isEmpty());
    }

    private CompensationVO findByApplyNo(List<CompensationVO> list, String applyNo) {
        return list.stream()
            .filter(item -> applyNo.equals(item.getApplyNo()))
            .findFirst()
            .orElseThrow(() -> new AssertionError("Expected applyNo not found: " + applyNo));
    }

    private boolean containsDocument(List<AttachmentFileVO> attachments, String documentName) {
        return attachments.stream()
            .anyMatch(item -> documentName.equals(item.getDocumentName()));
    }
}
