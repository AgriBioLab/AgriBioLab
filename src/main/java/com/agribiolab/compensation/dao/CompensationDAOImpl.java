package com.agribiolab.compensation.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import com.agribiolab.common.DBUtil;
import com.agribiolab.compensation.vo.AttachmentFileVO;
import com.agribiolab.compensation.vo.CompensationDetailVO;
import com.agribiolab.compensation.vo.CompensationSearchVO;
import com.agribiolab.compensation.vo.CompensationVO;

public class CompensationDAOImpl implements CompensationDAO {
    private static final String LIST_SELECT =
        "SELECT " +
        "    ada.app_id AS apply_no, " +
        "    ap.app_category AS target_type_name, " +
        "    NVL(ap.organization_name, '-') AS business_name, " +
        "    SUBSTR(ap.representative_name, 1, 1) || '*' || SUBSTR(ap.representative_name, -1) AS owner_name_masked, " +
        "    ada.product_name AS item_name, " +
        "    calc.final_compensation_amount AS final_amount, " +
        "    pay.payment_completion_date AS payment_date, " +
        "    pay.payment_institution AS payment_org_name " +
        "FROM agriculture_damage_app ada " +
        "JOIN applicant ap ON ap.applicant_id = ada.applicant_id " +
        "LEFT JOIN compensation_claim claim ON claim.app_id = ada.app_id " +
        "LEFT JOIN compensation_calc calc ON calc.claim_id = claim.compensation_claim_id " +
        "LEFT JOIN compensation_payment pay ON pay.compensation_claim_id = claim.compensation_claim_id " +
        "WHERE 1 = 1 ";

    private static final String LIST_ORDER =
        "ORDER BY pay.payment_completion_date DESC NULLS LAST, ada.app_id DESC";

    private static final String DETAIL_SELECT =
        "SELECT " +
        "    ada.app_id AS apply_no, " +
        "    ap.app_category AS target_type, " +
        "    ap.app_category AS target_type_name, " +
        "    ap.organization_name AS business_name, " +
        "    ap.representative_name AS owner_name, " +
        "    ada.disaster_type, " +
        "    ada.product_name AS item_name, " +
        "    ada.production_area AS production_place, " +
        "    claim.compensation_claim_amount AS request_amount, " +
        "    claim.claim_date AS request_date, " +
        "    claim.compensation_claim_quantity AS request_qty_kg, " +
        "    claim.compensation_claim_area AS request_area_m2, " +
        "    calc.calc_criterion AS basis_name, " +
        "    calc.criterion_unit_price AS unit_price, " +
        "    calc.compensation_applied_rate AS apply_rate, " +
        "    NULL AS calculation_formula_text, " +
        "    calc.difference_reason AS adjustment_reason, " +
        "    calc.calc_institution_name AS calculation_org_name, " +
        "    calc.calc_charger_name AS calculation_manager_name, " +
        "    calc.calc_completion_date AS calculated_at, " +
        "    calc.final_compensation_amount AS final_amount, " +
        "    pay.payment_decision_date AS payment_confirmed_at, " +
        "    pay.payment_completion_date AS payment_date, " +
        "    pay.payment_institution AS payment_org_name, " +
        "    pay.payment_charger_name AS payment_manager_name, " +
        "    pay.recipient_name AS payee_name, " +
        "    pay.payment_account_number AS masked_account_no, " +
        "    NULL AS payment_exclusion_reason, " +
        "    act.action_type AS action_method, " +
        "    act.plan_action_content AS plan_content, " +
        "    act.execution_confirm_quantity AS actual_action_qty_kg, " +
        "    act.execution_confirm_date AS result_checked_at, " +
        "    inv.invest_date AS survey_completed_at, " +
        "    1 AS final_survey_round, " +
        "    inv.damage_rate AS final_damage_rate, " +
        "    inv.damage_area AS final_damage_area_m2 " +
        "FROM agriculture_damage_app ada " +
        "JOIN applicant ap ON ap.applicant_id = ada.applicant_id " +
        "LEFT JOIN compensation_claim claim ON claim.app_id = ada.app_id " +
        "LEFT JOIN compensation_calc calc ON calc.claim_id = claim.compensation_claim_id " +
        "LEFT JOIN compensation_payment pay ON pay.compensation_claim_id = claim.compensation_claim_id " +
        "LEFT JOIN damage_action act ON act.app_id = ada.app_id " +
        "LEFT JOIN damage_site_invest inv ON inv.app_id = ada.app_id " +
        "WHERE ada.app_id = ?";

    private static final String ATTACHMENT_SELECT =
        "WITH target AS (SELECT ? AS app_id FROM dual), " +
        "claim_target AS ( " +
        "    SELECT claim.compensation_claim_id, calc.compensation_calc_id, pay.compensation_payment_id " +
        "    FROM compensation_claim claim " +
        "    LEFT JOIN compensation_calc calc ON calc.claim_id = claim.compensation_claim_id " +
        "    LEFT JOIN compensation_payment pay ON pay.compensation_claim_id = claim.compensation_claim_id " +
        "    JOIN target t ON t.app_id = claim.app_id " +
        "), action_target AS ( " +
        "    SELECT damage_action_id FROM damage_action act JOIN target t ON t.app_id = act.app_id " +
        "), invest_target AS ( " +
        "    SELECT invest_id FROM damage_site_invest inv JOIN target t ON t.app_id = inv.app_id " +
        ") " +
        "SELECT * FROM ( " +
        "    SELECT app_doc_id AS file_id, 'APP' AS file_category, doc_name AS document_name, " +
        "           '신청' AS submit_source, NULL AS submitted_at, NULL AS checked_yn, " +
        "           NULL AS checked_text, NULL AS checked_at, NULL AS checked_by, file_url AS file_path " +
        "    FROM app_doc d JOIN target t ON t.app_id = d.app_id " +
        "    UNION ALL " +
        "    SELECT 100000 + d.invest_doc_id AS file_id, 'INVEST' AS file_category, d.doc_name AS document_name, " +
        "           '현장조사' AS submit_source, NULL AS submitted_at, NULL AS checked_yn, " +
        "           NULL AS checked_text, NULL AS checked_at, NULL AS checked_by, d.file_url AS file_path " +
        "    FROM invest_doc d JOIN invest_target it ON it.invest_id = d.invest_id " +
        "    UNION ALL " +
        "    SELECT 200000 + d.action_doc_id AS file_id, 'ACTION' AS file_category, d.doc_name AS document_name, " +
        "           '피해조치' AS submit_source, NULL AS submitted_at, NULL AS checked_yn, " +
        "           NULL AS checked_text, NULL AS checked_at, NULL AS checked_by, d.file_url AS file_path " +
        "    FROM damage_action_doc d JOIN action_target at ON at.damage_action_id = d.action_id " +
        "    UNION ALL " +
        "    SELECT 300000 + d.claim_doc_id AS file_id, 'COMP' AS file_category, d.doc_name AS document_name, " +
        "           d.submission_place AS submit_source, d.submission_date AS submitted_at, " +
        "           CASE WHEN d.confirm_date IS NULL THEN 'N' ELSE 'Y' END AS checked_yn, " +
        "           CASE WHEN d.confirm_date IS NULL THEN '서류 확인 전' ELSE '서류 확인 완료' END AS checked_text, " +
        "           d.confirm_date AS checked_at, d.reviewer_name AS checked_by, d.file_url AS file_path " +
        "    FROM compensation_claim_doc d JOIN claim_target ct ON ct.compensation_claim_id = d.compensation_claim_id " +
        "    UNION ALL " +
        "    SELECT 400000 + d.calc_doc_id AS file_id, 'COMP' AS file_category, d.doc_name AS document_name, " +
        "           '보상금 산정' AS submit_source, NULL AS submitted_at, NULL AS checked_yn, " +
        "           NULL AS checked_text, NULL AS checked_at, NULL AS checked_by, d.file_url AS file_path " +
        "    FROM compensation_calc_doc d JOIN claim_target ct ON ct.compensation_calc_id = d.compensation_calc_id " +
        "    UNION ALL " +
        "    SELECT 500000 + d.payment_doc_id AS file_id, 'COMP' AS file_category, d.doc_name AS document_name, " +
        "           '보상금 지급' AS submit_source, NULL AS submitted_at, NULL AS checked_yn, " +
        "           NULL AS checked_text, NULL AS checked_at, NULL AS checked_by, d.file_url AS file_path " +
        "    FROM compensation_payment_doc d JOIN claim_target ct ON ct.compensation_payment_id = d.compensation_payment_id " +
        ") docs " +
        "WHERE (? IS NULL OR docs.file_category = ?) " +
        "ORDER BY docs.file_category, docs.submitted_at DESC NULLS LAST, docs.file_id DESC";

    @Override
    public List<CompensationVO> findCompensationList(CompensationSearchVO search) throws SQLException {
        QueryBuilder query = buildListQuery(search);
        List<CompensationVO> list = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(query.toSql());
            query.bind(pstmt);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(mapCompensation(rs));
            }
            return list;
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
    }

    @Override
    public Optional<CompensationDetailVO> findCompensationDetailByApplyNo(String applyNo) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(DETAIL_SELECT);
            pstmt.setString(1, applyNo);
            rs = pstmt.executeQuery();

            if (!rs.next()) {
                return Optional.empty();
            }

            CompensationDetailVO detail = mapCompensationDetail(rs);
            detail.setAttachments(findCompensationAttachments(applyNo, null));
            return Optional.of(detail);
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
    }

    @Override
    public List<AttachmentFileVO> findCompensationAttachments(String applyNo, String fileCategory) throws SQLException {
        List<AttachmentFileVO> attachments = new ArrayList<>();
        String normalizedCategory = normalizeCategory(fileCategory);

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(ATTACHMENT_SELECT);
            pstmt.setString(1, applyNo);
            pstmt.setString(2, normalizedCategory);
            pstmt.setString(3, normalizedCategory);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                attachments.add(mapAttachment(rs));
            }
            return attachments;
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
    }

    private QueryBuilder buildListQuery(CompensationSearchVO search) {
        QueryBuilder query = new QueryBuilder(LIST_SELECT);
        if (search == null) {
            query.append(" ").append(LIST_ORDER);
            return query;
        }

        if (search.getStartDate() != null) {
            query.append("AND pay.payment_completion_date >= ? ");
            query.add(Date.valueOf(search.getStartDate()));
        }
        if (search.getEndDate() != null) {
            query.append("AND pay.payment_completion_date < ? ");
            query.add(Date.valueOf(search.getEndDate().plusDays(1)));
        }
        if (hasText(search.getApplyNo())) {
            query.append("AND ada.app_id = ? ");
            query.add(search.getApplyNo().trim());
        }
        if (hasText(search.getBizName())) {
            query.append("AND ap.organization_name LIKE '%' || ? || '%' ");
            query.add(search.getBizName().trim());
        }
        if (hasText(search.getOwnerName())) {
            query.append("AND ap.representative_name LIKE '%' || ? || '%' ");
            query.add(search.getOwnerName().trim());
        }
        if (hasText(search.getTargetType())) {
            query.append("AND ap.app_category = ? ");
            query.add(toAppCategory(search.getTargetType()));
        }
        if (hasText(search.getItemName())) {
            query.append("AND ada.product_name LIKE '%' || ? || '%' ");
            query.add(search.getItemName().trim());
        }

        query.append(" ").append(LIST_ORDER);
        return query;
    }

    private CompensationVO mapCompensation(ResultSet rs) throws SQLException {
        CompensationVO compensation = new CompensationVO();
        compensation.setApplyNo(rs.getString("apply_no"));
        compensation.setTargetTypeName(rs.getString("target_type_name"));
        compensation.setBusinessName(rs.getString("business_name"));
        compensation.setOwnerNameMasked(rs.getString("owner_name_masked"));
        compensation.setItemName(rs.getString("item_name"));
        compensation.setFinalAmount(rs.getBigDecimal("final_amount"));
        compensation.setPaymentDate(getLocalDate(rs, "payment_date"));
        compensation.setPaymentOrgName(rs.getString("payment_org_name"));
        return compensation;
    }

    private CompensationDetailVO mapCompensationDetail(ResultSet rs) throws SQLException {
        CompensationDetailVO detail = new CompensationDetailVO();
        detail.setApplyNo(rs.getString("apply_no"));
        detail.setTargetType(rs.getString("target_type"));
        detail.setTargetTypeName(rs.getString("target_type_name"));
        detail.setBusinessName(rs.getString("business_name"));
        detail.setOwnerName(rs.getString("owner_name"));
        detail.setDisasterType(rs.getString("disaster_type"));
        detail.setItemName(rs.getString("item_name"));
        detail.setProductionPlace(rs.getString("production_place"));
        detail.setRequestAmount(rs.getBigDecimal("request_amount"));
        detail.setRequestDate(getLocalDate(rs, "request_date"));
        detail.setRequestQtyKg(rs.getBigDecimal("request_qty_kg"));
        detail.setRequestAreaM2(rs.getBigDecimal("request_area_m2"));
        detail.setBasisName(rs.getString("basis_name"));
        detail.setUnitPrice(rs.getBigDecimal("unit_price"));
        detail.setApplyRate(rs.getBigDecimal("apply_rate"));
        detail.setCalculationFormulaText(rs.getString("calculation_formula_text"));
        detail.setAdjustmentReason(rs.getString("adjustment_reason"));
        detail.setCalculationOrgName(rs.getString("calculation_org_name"));
        detail.setCalculationManagerName(rs.getString("calculation_manager_name"));
        detail.setCalculatedAt(getLocalDate(rs, "calculated_at"));
        detail.setFinalAmount(rs.getBigDecimal("final_amount"));
        detail.setPaymentConfirmedAt(getLocalDate(rs, "payment_confirmed_at"));
        detail.setPaymentDate(getLocalDate(rs, "payment_date"));
        detail.setPaymentOrgName(rs.getString("payment_org_name"));
        detail.setPaymentManagerName(rs.getString("payment_manager_name"));
        detail.setPayeeName(rs.getString("payee_name"));
        detail.setMaskedAccountNo(rs.getString("masked_account_no"));
        detail.setPaymentExclusionReason(rs.getString("payment_exclusion_reason"));
        detail.setActionMethod(rs.getString("action_method"));
        detail.setPlanContent(rs.getString("plan_content"));
        detail.setActualActionQtyKg(rs.getBigDecimal("actual_action_qty_kg"));
        detail.setResultCheckedAt(getLocalDate(rs, "result_checked_at"));
        detail.setSurveyCompletedAt(getLocalDate(rs, "survey_completed_at"));
        detail.setFinalSurveyRound(getInteger(rs, "final_survey_round"));
        detail.setFinalDamageRate(rs.getBigDecimal("final_damage_rate"));
        detail.setFinalDamageAreaM2(rs.getBigDecimal("final_damage_area_m2"));
        return detail;
    }

    private AttachmentFileVO mapAttachment(ResultSet rs) throws SQLException {
        AttachmentFileVO file = new AttachmentFileVO();
        file.setFileId(rs.getLong("file_id"));
        file.setFileCategory(rs.getString("file_category"));
        file.setDocumentName(rs.getString("document_name"));
        file.setSubmitSource(rs.getString("submit_source"));
        file.setSubmittedAt(getLocalDate(rs, "submitted_at"));
        file.setCheckedYn(rs.getString("checked_yn"));
        file.setCheckedText(rs.getString("checked_text"));
        file.setCheckedAt(getLocalDate(rs, "checked_at"));
        file.setCheckedBy(rs.getString("checked_by"));
        file.setFilePath(rs.getString("file_path"));
        return file;
    }

    private LocalDate getLocalDate(ResultSet rs, String columnName) throws SQLException {
        Date date = rs.getDate(columnName);
        return date == null ? null : date.toLocalDate();
    }

    private Integer getInteger(ResultSet rs, String columnName) throws SQLException {
        int value = rs.getInt(columnName);
        return rs.wasNull() ? null : value;
    }

    private String toAppCategory(String targetType) {
        String value = targetType.trim();
        if ("PRODUCER".equalsIgnoreCase(value)) {
            return "생산자";
        }
        if ("DISTRIBUTOR".equalsIgnoreCase(value)) {
            return "유통자";
        }
        if ("SELLER".equalsIgnoreCase(value)) {
            return "판매자";
        }
        return value;
    }

    private String normalizeCategory(String fileCategory) {
        return hasText(fileCategory) ? fileCategory.trim().toUpperCase() : null;
    }

    private boolean hasText(String value) {
        return value != null && !value.trim().isEmpty();
    }

    private static class QueryBuilder {
        private final StringBuilder sql;
        private final List<Object> params = new ArrayList<>();

        QueryBuilder(String sql) {
            this.sql = new StringBuilder(sql);
        }

        QueryBuilder append(String value) {
            sql.append(value);
            return this;
        }

        void add(Object value) {
            params.add(value);
        }

        void bind(PreparedStatement pstmt) throws SQLException {
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(i + 1, params.get(i));
            }
        }

        String toSql() {
            return sql.toString();
        }
    }
}
