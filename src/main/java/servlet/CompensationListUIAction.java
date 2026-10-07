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

        List<CompensationListVO> compensationList = dao.getCompensationList();
        
        request.setAttribute("compensationList", compensationList);
		
		return "view/compensationResultList.jsp";
	}

}
