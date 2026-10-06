package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import model.dao.CompensationDetailDAO;
import model.vo.CompensationDetailSummaryVO;
import util.DBCP;

public class compensationSummaryAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		try {
			String appId = request.getParameter("appId");
			CompensationDetailDAO dao = new CompensationDetailDAO(DBCP.getConnection());
			CompensationDetailSummaryVO vo = dao.getCompensationDetail(appId);
			Long day = (vo.getPaymentCompletionDate().getTime() - vo.getClaimDate().getTime());
			request.setAttribute("summary", vo);
			request.setAttribute("day", day);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "view/compensationResultDetail.jsp";
	}

}
