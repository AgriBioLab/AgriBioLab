package model.dao.lwg;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.lwg.ApplicationReceptionVO;
import model.vo.lwg.CompensationCalculationVO;
import model.vo.lwg.CompensationPaymentVO;
import model.vo.lwg.DocumentsVO;
import model.vo.lwg.CompensationProgressVO;
import util.Query_lwg;

public class CompensationDetailDAO {

	private Connection conn;

	public CompensationDetailDAO(Connection conn) {
		this.conn = conn;
	}

	public ApplicationReceptionVO getApplicationReception(String appId) {
		ApplicationReceptionVO appVO = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query_lwg.GET_APPLICATION_RECEPTION);
			pstmt.setString(1, appId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				appVO = new ApplicationReceptionVO(
						rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return appVO;
	}

	public CompensationCalculationVO getCompensationCalculation(int compensationClaimId) {
		CompensationCalculationVO calcVO = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query_lwg.GET_COMPENSATION_CALCULATION);
			pstmt.setInt(1, compensationClaimId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next() ) {
				calcVO = new CompensationCalculationVO(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getInt(6), rs.getInt(7), rs.getInt(8), rs.getString(9));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return calcVO;
	}

	public CompensationPaymentVO getCompensationPayment(int compensationClaimId) {
		CompensationPaymentVO paymentVO = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query_lwg.GET_COMPENSATION_PAYMENT);
			pstmt.setInt(1, compensationClaimId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next() ) {
				paymentVO = new CompensationPaymentVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return paymentVO;
	}

	public List<DocumentsVO> getCompensationPaymentDocuments(int compensationClaimId) {
		List<DocumentsVO> documentsVOs = new ArrayList<DocumentsVO>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query_lwg.GET_COMPENSATION_PAYMENT_DOCUMENTS);
			pstmt.setInt(1, compensationClaimId);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				documentsVOs.add(new DocumentsVO(rs.getString(1), rs.getString(2)));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return documentsVOs;
	}

	public CompensationProgressVO getCompensationProgress(String appId) {
		CompensationProgressVO progressVO = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(Query_lwg.GET_COMPENSATION_PROGRESS);
			pstmt.setString(1, appId);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next() ) {
				progressVO = new CompensationProgressVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
			}

			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return progressVO;
	}

}
