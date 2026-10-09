package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.vo.CompensationListVO;
import model.vo.QualityOfficerVO;
import util.PrivacyMaskingUtil;
import util.Query;

public class QualityOfficerDAO {
	private Connection conn;
	
	public QualityOfficerDAO(Connection conn) { 
		this.conn=conn;
	}

    public QualityOfficerVO login(String username, String password) {
    	QualityOfficerVO vo = null;
    		
    	try {
    			PreparedStatement pstmt=conn.prepareStatement(Query.QUALITY_OFFICER_LOGIN);
    			pstmt.setString(1,username);
    			pstmt.setString(2, password);
    			ResultSet rs=pstmt.executeQuery();
    			
    			if(rs.next()) {
    				vo = new QualityOfficerVO(rs.getString("username"), rs.getString("password"),rs.getString("name"), rs.getString("position"));
    			}
    			
    			vo.setName(PrivacyMaskingUtil.maskName(vo.getName()));
    			
    			rs.close();
    			pstmt.close();
    	} catch (SQLException e) {
    			e.printStackTrace();
    	}
    	return vo;
    	}
}

