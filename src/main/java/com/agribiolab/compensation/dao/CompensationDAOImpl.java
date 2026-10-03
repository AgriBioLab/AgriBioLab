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
        "    a.apply_no, " +
        "    CASE a.target_type " +
        "        WHEN 'PRODUCER' THEN '생산자' " +
        "        WHEN 'DISTRIBUTOR' THEN '유통자' " +
        "        WHEN 'SELLER' THEN '판매자' " +
        "    END AS target_type_name, " +
        "    NVL(a.business_name, '-') AS business_name, " +
        "    SUBSTR(a.owner_name, 1, 1) || '*' || SUBSTR(a.owner_name, -1) AS owner_name_masked, " +
        "    a.item_name, " +
        "    c.final_amount, " +
        "    c.payment_date, " +
        "    c.payment_org_name " +
        "FROM damage_application a " +
        "JOIN compensation c ON c.application_id = a.application_id " +
        "WHERE 1 = 1 ";

    private static final String LIST_ORDER =
        "ORDER BY c.payment_date DESC NULLS LAST, a.apply_no DESC";

    private static final String DETAIL_SELECT =
        "SELECT " +
        "    a.apply_no, " +
        "    a.target_type, " +
        "    CASE a.target_type " +
        "        WHEN 'PRODUCER' THEN '생산자' " +
        "        WHEN 'DISTRIBUTOR' THEN '유통자' " +
        "        WHEN 'SELLER' THEN '판매자' " +
        "    END AS target_type_name, " +
        "    a.business_name, " +
        "    a.owner_name, " +
        "    a.disaster_type, " +
        "    a.item_name, " +
        "    a.production_place, " +
        "    c.request_amount, " +
        "    c.request_date, " +
        "    c.request_qty_kg, " +
        "    c.request_area_m2, " +
        "    c.basis_name, " +
        "    c.unit_price, " +
        "    c.apply_rate, " +
        "    c.calculation_formula_text, " +
        "    c.adjustment_reason, " +
        "    c.calculation_org_name, " +
        "    c.calculation_manager_name, " +
        "    c.calculated_at, " +
        "    c.final_amount, " +
        "    c.payment_confirmed_at, " +
        "    c.payment_date, " +
        "    c.payment_org_name, " +
        "    c.payment_manager_name, " +
        "    c.payee_name, " +
        "    c.masked_account_no, " +
        "    c.payment_exclusion_reason, " +
        "    ar.action_method, " +
        "    ar.plan_content, " +
        "    ar.actual_action_qty_kg, " +
        "    ar.result_checked_at, " +
        "    s.survey_completed_at, " +
        "    s.final_survey_round, " +
        "    s.final_damage_rate, " +
        "    s.final_damage_area_m2 " +
        "FROM damage_application a " +
        "JOIN compensation c ON c.application_id = a.application_id " +
        "LEFT JOIN damage_action_result ar ON ar.application_id = a.application_id " +
        "LEFT JOIN damage_survey s ON s.application_id = a.application_id " +
        "WHERE a.apply_no = ?";

    private static final String ATTACHMENT_SELECT =
        "SELECT " +
        "    f.file_id, " +
        "    f.file_category, " +
        "    f.document_name, " +
        "    f.submit_source, " +
        "    f.submitted_at, " +
        "    f.checked_yn, " +
        "    CASE f.checked_yn " +
        "        WHEN 'Y' THEN '서류 확인 완료' " +
        "        ELSE '서류 확인 전' " +
        "    END AS checked_text, " +
        "    f.checked_at, " +
        "    f.checked_by, " +
        "    f.file_path " +
        "FROM attachment_file f " +
        "JOIN damage_application a ON a.application_id = f.application_id " +
        "LEFT JOIN compensation c ON c.compensation_id = f.compensation_id " +
        "WHERE a.apply_no = ? ";

    private static final String ATTACHMENT_ORDER =
        "ORDER BY f.file_category, f.submitted_at DESC, f.file_id DESC";

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
        QueryBuilder query = buildAttachmentQuery(fileCategory);
        List<AttachmentFileVO> attachments = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(query.toSql());
            pstmt.setString(1, applyNo);
            query.bindFrom(pstmt, 2);
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
            query.append("AND c.payment_date >= ? ");
            query.add(Date.valueOf(search.getStartDate()));
        }
        if (search.getEndDate() != null) {
            query.append("AND c.payment_date < ? ");
            query.add(Date.valueOf(search.getEndDate().plusDays(1)));
        }
        if (hasText(search.getApplyNo())) {
            query.append("AND a.apply_no = ? ");
            query.add(search.getApplyNo().trim());
        }
        if (hasText(search.getBizName())) {
            query.append("AND a.business_name LIKE '%' || ? || '%' ");
            query.add(search.getBizName().trim());
        }
        if (hasText(search.getOwnerName())) {
            query.append("AND a.owner_name LIKE '%' || ? || '%' ");
            query.add(search.getOwnerName().trim());
        }
        if (hasText(search.getTargetType())) {
            query.append("AND a.target_type = ? ");
            query.add(search.getTargetType().trim());
        }
        if (hasText(search.getItemName())) {
            query.append("AND a.item_name LIKE '%' || ? || '%' ");
            query.add(search.getItemName().trim());
        }

        query.append(" ").append(LIST_ORDER);
        return query;
    }

    private QueryBuilder buildAttachmentQuery(String fileCategory) {
        QueryBuilder query = new QueryBuilder(ATTACHMENT_SELECT);
        if (hasText(fileCategory)) {
            query.append("AND f.file_category = ? ");
            query.add(fileCategory.trim());
        }
        query.append(" ").append(ATTACHMENT_ORDER);
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
            bindFrom(pstmt, 1);
        }

        void bindFrom(PreparedStatement pstmt, int startIndex) throws SQLException {
            for (int i = 0; i < params.size(); i++) {
                pstmt.setObject(startIndex + i, params.get(i));
            }
        }

        String toSql() {
            return sql.toString();
        }
    }
}
