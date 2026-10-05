package model.dao.js;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.js.CompensationClaimVO;
import model.vo.js.DocumentVO;
import model.vo.js.InvestigationSummaryVO;
import util.js.Query;

public class CompensationDetailDAO {
	private Connection conn;
	public CompensationDetailDAO(Connection conn) {
		this.conn = conn;
	}

	public CompensationClaimVO getCompensationClaim(String appId) {
		CompensationClaimVO compensationClaimVo = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_COMPENSATION_CLAIM);
			pstmt.setString(1, appId);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) { 
				compensationClaimVo = new CompensationClaimVO(
						rs.getInt(1),
						rs.getInt(4),
						rs.getInt(2),
						rs.getDate(3));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return compensationClaimVo;
	}

	public InvestigationSummaryVO getDamageInvestigationSummary(String applicationId) {
		InvestigationSummaryVO investVo = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_INVESTIGATION_SUMMARY);
			pstmt.setString(1, applicationId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				investVo = new InvestigationSummaryVO(rs.getString(1), rs.getInt(2), rs.getInt(3));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return investVo;
	}

	public List<DocumentVO> getApplicationDocuments(String applicationId) {
		List<DocumentVO> documentVOs = new ArrayList<DocumentVO>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_APPLICATION_DOCUMENTS);
			pstmt.setString(1,  applicationId);

			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				documentVOs.add(new DocumentVO(rs.getString(1), rs.getString(2)));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return documentVOs;
	}
}

