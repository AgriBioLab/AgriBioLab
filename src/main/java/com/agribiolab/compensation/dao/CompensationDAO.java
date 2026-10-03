package com.agribiolab.compensation.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import com.agribiolab.compensation.vo.AttachmentFileVO;
import com.agribiolab.compensation.vo.CompensationDetailVO;
import com.agribiolab.compensation.vo.CompensationSearchVO;
import com.agribiolab.compensation.vo.CompensationVO;

public interface CompensationDAO {
    List<CompensationVO> findCompensationList(CompensationSearchVO search) throws SQLException;

    Optional<CompensationDetailVO> findCompensationDetailByApplyNo(String applyNo) throws SQLException;

    List<AttachmentFileVO> findCompensationAttachments(String applyNo, String fileCategory) throws SQLException;
}
