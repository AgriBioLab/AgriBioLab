package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import model.dao.CompensationListDAO;
import model.vo.CompensationListVO;
import util.DBCP;

public class CompensationListUIAction implements Action{
	private static Connection conn;
	private static CompensationListDAO dao;

	public CompensationListUIAction() throws SQLException {
		conn = DBCP.getConnection();
		dao = new CompensationListDAO(conn);
	}

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
        
		List<CompensationListVO> compensationList;
		
		String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String appId = request.getParameter("appId");
        String organizationName = request.getParameter("organizationName");
        String representativeName = request.getParameter("representativeName");
        String appCategory = request.getParameter("appCategory");
        String productName = request.getParameter("productName");
        
     // 검색 조건이 하나라도 있으면 조건 검색
        if ((startDate != null && !startDate.isBlank())
                || (endDate != null && !endDate.isBlank())
                || (appId != null && !appId.isBlank())
                || (organizationName != null && !organizationName.isBlank())
                || (representativeName != null && !representativeName.isBlank())
                || (appCategory != null && !appCategory.isBlank())
                || (productName != null && !productName.isBlank())) {
        	compensationList = dao.searchCompensationList(
            		startDate, 
            		endDate, 
            		appId, 
            		organizationName, 
            		representativeName, 
            		appCategory, 
            		productName);
        
        } else {
        	// 검색 조건이 없으면 전체 목록 조회
        	compensationList = dao.getCompensationList();
        }
        		
        request.setAttribute("compensationList", compensationList);
        
		return "view/compensationResultList.jsp";
	}

}
