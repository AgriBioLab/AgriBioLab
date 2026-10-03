package com.agribiolab.manager.dao;

import java.sql.SQLException;
import java.util.Optional;

import com.agribiolab.manager.vo.QualityManagerVO;

public interface QualityManagerDAO {
    Optional<QualityManagerVO> findByLoginId(String loginId) throws SQLException;

    int updateLastLoginAt(long managerId) throws SQLException;
}
