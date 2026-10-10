package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.vo.CompensationListVO;
import util.PrivacyMaskingUtil;
import util.Query;

public class CompensationListDAO {
	private Connection conn;
	
	public CompensationListDAO(Connection conn) { 
		this.conn=conn;
	}
	
	public List<CompensationListVO> searchCompensationList(String startDate,  String endDate, String appId, String organizationName, String representativeName, String appCategory, String productName) {
		List<CompensationListVO> list = new ArrayList<>();
		
		StringBuilder sql = new StringBuilder(Query.SEARCH_COMPENSATIONLIST);
		
        if (startDate != null && endDate != null && !startDate.isBlank() && !endDate.isBlank()) { sql.append(Query.SEARCH_BY_PAYMENT_COMPLETION_DATE); }
        if (appId != null && !appId.isBlank()) { sql.append(Query.SEARCH_BY_APP_ID); }
        if (organizationName != null && !organizationName.isBlank()) { sql.append(Query.SEARCH_BY_ORGANIZATION_NAME); }
        if (representativeName != null && !representativeName.isBlank()) { sql.append(Query.SEARCH_BY_REPRESENTATIVE_NAME); }
        if (appCategory != null && !appCategory.isBlank()) { sql.append(Query.SEARCH_BY_APP_CATEGORY); }
        if (productName != null && !productName.isBlank()) { sql.append(Query.SEARCH_BY_PRODUCT_NAME); }
        sql.append("ORDER BY a.app_date DESC");
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql.toString());
			
			int index = 1;

		    if (startDate != null && !startDate.isBlank()) { pstmt.setString(index++, startDate); }
		    if (endDate != null && !endDate.isBlank()) { pstmt.setString(index++, endDate); }
		    if (appId != null && !appId.isBlank()) { pstmt.setString(index++, appId); }
		    if (organizationName != null && !organizationName.isBlank()) { pstmt.setString(index++, "%" + organizationName + "%"); }
		    if (representativeName != null && !representativeName.isBlank()) { pstmt.setString(index++, "%" + representativeName + "%"); }
		    if (appCategory != null && !appCategory.isBlank()) { pstmt.setString(index++, appCategory); }
		    if (productName != null && !productName.isBlank()) { pstmt.setString(index++, "%" + productName + "%"); }
		    ResultSet rs = pstmt.executeQuery();

			while(rs.next()) {
				CompensationListVO vo = new CompensationListVO(
			            rs.getString("app_id"),
			            rs.getString("product_name"),
			            rs.getString("app_category"),
			            rs.getString("representative_name"),
			            rs.getString("organization_name"),
			            rs.getDate("payment_completion_date"),
			            rs.getInt("payment_amount"),
			            rs.getString("payment_institution")
			        );

			        list.add(vo);
			}
			
			for(CompensationListVO vo : list) {
				vo.setRepresentativeName(PrivacyMaskingUtil.maskName(vo.getRepresentativeName()));
			}
						
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<CompensationListVO> getCompensationList() {
		List<CompensationListVO> list = new ArrayList<>();
		
		try {
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery(Query.GET_COMPENSATIONLIST);
			
			while(rs.next()) {
				list.add( new CompensationListVO(rs.getString("app_id"), rs.getString("product_name"), rs.getString("app_category"), rs.getString("representative_name"), rs.getString("organization_name"), rs.getDate("payment_completion_date"), rs.getInt("payment_amount"), rs.getString("payment_institution")));
			}
			
			for(CompensationListVO vo : list) {
				vo.setRepresentativeName(PrivacyMaskingUtil.maskName(vo.getRepresentativeName()));
			}
						
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
