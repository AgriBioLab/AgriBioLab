package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.DamageApplicationReceptionVO;
import model.vo.CompensationCalcVO;
import model.vo.CompensationClaimDocumentVO;
import model.vo.CompensationSummaryVO;
import model.vo.CompensationPaymentVO;
import model.vo.CompensationProgressVO;
import model.vo.DamageActionSummaryVO;
import model.vo.DocumentsVO;
import model.vo.InvestigationSummaryVO;
import model.vo.CompensationClaimVO;
import util.Query;

public class CompensationDetailDAO {
	private Connection conn;
	
	public CompensationDetailDAO(Connection conn) { 
		this.conn=conn;
	}
	
	public CompensationSummaryVO getCompensationSummary(String applicationId) {
		CompensationSummaryVO vo = null;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_COMPENSATION_DETAIL);
			pstmt.setString(1,applicationId);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new CompensationSummaryVO(applicationId, rs.getString("app_status"), rs.getInt("compensation_claim_amount"), rs.getInt("payment_amount"), rs.getString("action_charger_name"), rs.getDate("claim_date"), rs.getDate("payment_completion_date"));	
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
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_DAMAGE_ACTION_SUMMARY);
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

	public List<DocumentsVO> getInvestigationDocuments(int compensationClaimId) {
		List<DocumentsVO> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_INVESTIGATION_DOCUMENTS);
			pstmt.setInt(1,compensationClaimId);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new DocumentsVO(rs.getString("doc_name"), rs.getString("file_url")));	
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
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_COMPENSATION_CLAIM_DOCUMENTS);
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
	
	
	public DamageApplicationReceptionVO getDamageApplicationReception(String appId) {
		DamageApplicationReceptionVO appVO = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_APPLICATION_RECEPTION);
			pstmt.setString(1, appId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				appVO = new DamageApplicationReceptionVO(
						rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return appVO;
	}

	public CompensationCalcVO getCompensationCalc(int compensationClaimId) {
		CompensationCalcVO calcVO = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_COMPENSATION_CALCULATION);
			pstmt.setInt(1, compensationClaimId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next() ) {
				calcVO = new CompensationCalcVO(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return calcVO;
	}

	public CompensationPaymentVO getCompensationPayment(int compensationClaimId) {
		CompensationPaymentVO paymentVO = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_COMPENSATION_PAYMENT);
			pstmt.setInt(1, compensationClaimId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next() ) {
				paymentVO = new CompensationPaymentVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return paymentVO;
	}

	public List<DocumentsVO> getCompensationPaymentDocuments(int compensationClaimId) {
		List<DocumentsVO> documentsVOs = new ArrayList<DocumentsVO>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_COMPENSATION_PAYMENT_DOCUMENTS);
			pstmt.setInt(1, compensationClaimId);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				documentsVOs.add(new DocumentsVO(rs.getString(1), rs.getString(2)));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return documentsVOs;
	}

	public CompensationProgressVO getCompensationProgress(String appId) {
		CompensationProgressVO progressVO = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_COMPENSATION_PROGRESS);
			pstmt.setString(1, appId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next() ) {
				progressVO = new CompensationProgressVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return progressVO;
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
			e.printStackTrace();
		}
		return compensationClaimVo;
	}

	public InvestigationSummaryVO getInvestigationSummary(String applicationId) {
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
			e.printStackTrace();
		}

		return investVo;
	}

	public List<DocumentsVO> getDamageApplicationDocuments(String applicationId) {
		List<DocumentsVO> documentVOs = new ArrayList<DocumentsVO>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query.GET_APPLICATION_DOCUMENTS);
			pstmt.setString(1,  applicationId);

			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				documentVOs.add(new DocumentsVO(rs.getString(1), rs.getString(2)));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return documentVOs;
	}
	
	
	
	

}
