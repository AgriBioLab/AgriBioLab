package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.dao.CompensationListDAO;
import model.dao.QualityOfficerDAO;
import model.vo.CompensationListVO;
import model.vo.QualityOfficerVO;
import util.DBCP;

public class QualityOfficerLoginAction implements Action {

	private static Connection conn;
	private static CompensationListDAO dao;

	public QualityOfficerLoginAction() throws SQLException {
		conn = DBCP.getConnection();
		dao = new CompensationListDAO(conn);
	}
	
	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		List<CompensationListVO> compensationList;
		
		// 나중에 Service 연결해서 로그인 처리
		// 로그인 여부에 따라 url이 달라져야 한다.
		String url = null; // 에러, 메시지
		QualityOfficerVO qualityOfficer = new QualityOfficerDAO(conn).login(
		            request.getParameter("loginId"),
		            request.getParameter("loginPassword")
		        );


		if (qualityOfficer != null) {
		    String name = qualityOfficer.getName();
		    String position = qualityOfficer.getPosition();

		    HttpSession session = request.getSession(true);
		    session.setAttribute("loginOK", request.getParameter("loginId"));
		    session.setAttribute("loginName", name);
		    session.setAttribute("loginPosition", position);

		    url = "REDIRECT:/controller?cmd=compensationListUI";
		} else {
			request.setAttribute("loginError","아이디 또는 비밀번호가 올바르지 않습니다.");

		    url = "view/qualityOfficerLogin.jsp";
		}
				
		return url;
	}

}
