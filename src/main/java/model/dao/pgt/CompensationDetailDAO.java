package model.dao.pgt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.swdl.model.CustomerVO;
import kr.swdl.model.Query;
import model.vo.pgt.CompensationClaimDocumentVO;
import model.vo.pgt.CompensationDetailSummaryVO;
import model.vo.pgt.CompensationDocumentVO;
import model.vo.pgt.CompensationListVO;
import model.vo.pgt.DamageActionSummaryVO;
import model.vo.pgt.DocumentVO;
import util.Query_pgt;

public class CompensationDetailDAO {
	private Connection conn;
	
	public CompensationDetailDAO(Connection conn) { 
		this.conn=conn;
	}
	
	public CompensationDetailSummaryVO getCompensationDetail(String applicationId) {
		CompensationDetailSummaryVO vo = null;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(Query_pgt.GET_COMPENSATION_DETAIL);
			pstmt.setString(1,applicationId);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new CompensationDetailSummaryVO(applicationId, rs.getString("app_status"), rs.getInt("compensation_claim_amount"), rs.getInt("payment_amount"), rs.getString("action_charger_name"), rs.getDate("claim_date"), rs.getDate("payment_completion_date"));	
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;	
	}

	public DamageActionSummaryVO getDamageActionSummary(String applicationId) {
		DamageActionSummaryVO vo = null;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(Query_pgt.GET_DAMAGE_ACTION_SUMMARY);
			pstmt.setString(1,applicationId);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new DamageActionSummaryVO(rs.getString("action_type"), rs.getInt("execution_confirm_quantity"), rs.getString("plan_action_content"), rs.getDate("execution_confirm_date"));	
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;	
	}

	public List<DocumentVO> getInvestigationDocuments(int compensationClaimId) {
		List<DocumentVO> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(Query_pgt.GET_INVESTIGATION_DOCUMENTS);
			pstmt.setInt(1,compensationClaimId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new DocumentVO(rs.getString("doc_name"), rs.getString("file_url")));	
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;	
	}

	public List<CompensationClaimDocumentVO> getCompensationClaimDocuments(int compensationClaimId) {
		List<CompensationClaimDocumentVO> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(Query_pgt.GET_COMPENSATION_CLAIM_DOCUMENTS);
			pstmt.setInt(1,compensationClaimId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new CompensationClaimDocumentVO(rs.getString("doc_name"), rs.getString("submission_place"), rs.getDate("submission_date"), rs.getString("file_url"), rs.getString("reviewer_name"), rs.getDate("confirm_date")));	
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;	
	}
	
	
	
	

}
