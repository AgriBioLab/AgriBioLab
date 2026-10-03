package com.agribiolab.manager.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.sql.SQLException;
import java.util.Optional;

import org.junit.jupiter.api.Test;

import com.agribiolab.manager.vo.QualityManagerVO;
import com.agribiolab.testsupport.DaoTestSupport;

class QualityManagerDAOImplTest {
    private final QualityManagerDAO qualityManagerDAO = new QualityManagerDAOImpl();

    @Test
    void findByLoginId_returnsActiveManager() throws SQLException {
        DaoTestSupport.assumeDatabaseConfigured();

        Optional<QualityManagerVO> result = qualityManagerDAO.findByLoginId("quality01");

        assertTrue(result.isPresent());
        QualityManagerVO manager = result.get();
        assertEquals("quality01", manager.getLoginId());
        assertEquals("홍길동", manager.getManagerName());
        assertEquals("QUALITY_VIEWER", manager.getRoleCd());
        assertEquals("Y", manager.getUseYn());
    }

    @Test
    void findByLoginId_returnsEmptyForUnknownLoginId() throws SQLException {
        DaoTestSupport.assumeDatabaseConfigured();

        Optional<QualityManagerVO> result = qualityManagerDAO.findByLoginId("unknown");

        assertTrue(result.isEmpty());
    }

    @Test
    void findByLoginId_returnsEmptyForInactiveManager() throws SQLException {
        DaoTestSupport.assumeDatabaseConfigured();

        Optional<QualityManagerVO> result = qualityManagerDAO.findByLoginId("inactive01");

        assertTrue(result.isEmpty());
    }
}
