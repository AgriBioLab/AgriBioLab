package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.vo.CompensationListVO;
import util.Query;

public class CompensationListDAO {
	private Connection conn;
	
	public CompensationListDAO(Connection conn) { 
		this.conn=conn;
	}
	
	public CompensationListVO getCompensationListByApplicationId(String applicationId) {
		CompensationListVO vo = null;
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(Query.GET_COMPENSATIONLIST_BY_APPLICATION_ID);
			pstmt.setString(1,applicationId);
			ResultSet rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new CompensationListVO(rs.getString("app_id"), rs.getString("product_name"), rs.getString("app_category"), rs.getString("representative_name"), rs.getString("organization_name"), rs.getDate("payment_completion_date"), rs.getInt("payment_amount"));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return vo;
	}

	public List<CompensationListVO> getCompensationListByApplicationCategory(String applicationCategory){
		List<CompensationListVO> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(Query.GET_COMPENSATIONLIST_BY_APPLICATION_CATEGORY);
			pstmt.setString(1,applicationCategory);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new CompensationListVO(rs.getString("app_id"), rs.getString("product_name"), rs.getString("app_category"), rs.getString("representative_name"), rs.getString("organization_name"), rs.getDate("payment_completion_date"), rs.getInt("payment_amount")));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	public List<CompensationListVO> getCompensationListByOrganizationName(String organizationName) {
		List<CompensationListVO> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(Query.GET_COMPENSATIONLIST_BY_ORGANIZATION_NAME);
			pstmt.setString(1,organizationName);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new CompensationListVO(rs.getString("app_id"), rs.getString("product_name"), rs.getString("app_category"), rs.getString("representative_name"), rs.getString("organization_name"), rs.getDate("payment_completion_date"), rs.getInt("payment_amount")));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<CompensationListVO> getCompensationListByRepresentativeName(String representativeName) {
		List<CompensationListVO> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(Query.GET_COMPENSATIONLIST_BY_REPRESENTATIVE_NAME);
			pstmt.setString(1,representativeName);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new CompensationListVO(rs.getString("app_id"), rs.getString("product_name"), rs.getString("app_category"), rs.getString("representative_name"), rs.getString("organization_name"), rs.getDate("payment_completion_date"), rs.getInt("payment_amount")));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<CompensationListVO> getCompensationListByProductName(String productName) {
		List<CompensationListVO> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(Query.GET_COMPENSATIONLIST_BY_PRODUCT_NAME);
			pstmt.setString(1,productName);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new CompensationListVO(rs.getString("app_id"), rs.getString("product_name"), rs.getString("app_category"), rs.getString("representative_name"), rs.getString("organization_name"), rs.getDate("payment_completion_date"), rs.getInt("payment_amount")));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<CompensationListVO> getCompensationListByPaymentCompletionDate(String startDate, String endDate) {
		List<CompensationListVO> list = new ArrayList<>();
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(Query.GET_COMPENSATIONlIST_BY_PAYMENT_COMPLETION_DATE);
			pstmt.setString(1,startDate);
			pstmt.setString(2, endDate);
			ResultSet rs=pstmt.executeQuery();
			
			while(rs.next()) {
				list.add(new CompensationListVO(rs.getString("app_id"), rs.getString("product_name"), rs.getString("app_category"), rs.getString("representative_name"), rs.getString("organization_name"), rs.getDate("payment_completion_date"), rs.getInt("payment_amount")));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
