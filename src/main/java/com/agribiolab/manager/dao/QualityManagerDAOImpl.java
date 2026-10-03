package com.agribiolab.manager.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Optional;

import com.agribiolab.common.DBUtil;
import com.agribiolab.manager.vo.QualityManagerVO;

public class QualityManagerDAOImpl implements QualityManagerDAO {
    private static final String SELECT_BY_LOGIN_ID =
        "SELECT manager_id, login_id, password_hash, manager_name, role_cd, use_yn, last_login_at " +
        "FROM quality_manager " +
        "WHERE login_id = ? " +
        "AND use_yn = 'Y'";

    private static final String UPDATE_LAST_LOGIN_AT =
        "UPDATE quality_manager " +
        "SET last_login_at = SYSDATE " +
        "WHERE manager_id = ? " +
        "AND use_yn = 'Y'";

    @Override
    public Optional<QualityManagerVO> findByLoginId(String loginId) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(SELECT_BY_LOGIN_ID);
            pstmt.setString(1, loginId);
            rs = pstmt.executeQuery();

            if (!rs.next()) {
                return Optional.empty();
            }
            return Optional.of(mapQualityManager(rs));
        } finally {
            DBUtil.close(rs, pstmt, conn);
        }
    }

    @Override
    public int updateLastLoginAt(long managerId) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(UPDATE_LAST_LOGIN_AT);
            pstmt.setLong(1, managerId);
            return pstmt.executeUpdate();
        } finally {
            DBUtil.close(pstmt, conn);
        }
    }

    private QualityManagerVO mapQualityManager(ResultSet rs) throws SQLException {
        QualityManagerVO manager = new QualityManagerVO();
        manager.setManagerId(rs.getLong("manager_id"));
        manager.setLoginId(rs.getString("login_id"));
        manager.setPasswordHash(rs.getString("password_hash"));
        manager.setManagerName(rs.getString("manager_name"));
        manager.setRoleCd(rs.getString("role_cd"));
        manager.setUseYn(rs.getString("use_yn"));

        Timestamp lastLoginAt = rs.getTimestamp("last_login_at");
        if (lastLoginAt != null) {
            manager.setLastLoginAt(lastLoginAt.toLocalDateTime());
        }
        return manager;
    }
}
