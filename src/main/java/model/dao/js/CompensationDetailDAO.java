package model.dao.js;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.vo.js.CompensationClaimVO;

public class CompensationDetailDAO {
	private Connection conn;
	public CompensationDetailDAO(Connection conn) {
		this.conn = conn;
	}
	public CompensationClaimVO getCompensationClaim(String appId) {
		CompensationClaimVO compensationClaimVo = null;
	
		try {
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(
					util.js.Query.GET_COMPENSATION_CLAIM);
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
}

