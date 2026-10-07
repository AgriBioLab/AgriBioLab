package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import model.dao.CompensationDetailDAO;
import model.vo.CompensationCalcVO;
import model.vo.CompensationClaimVO;
import model.vo.CompensationSummaryVO;
import model.vo.DamageActionSummaryVO;
import model.vo.DamageApplicationVO;
import util.DBCP;

public class compensationDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		try {
			String appId = request.getParameter("appId");
			CompensationDetailDAO dao = new CompensationDetailDAO(DBCP.getConnection());
			CompensationSummaryVO compensationSummary = dao.getCompensationSummary(appId);
			CompensationClaimVO compensationClaim = dao.getCompensationClaim(appId);
			DamageActionSummaryVO damageActionSummary = dao.getDamageActionSummary(appId);
			DamageApplicationVO damageApplication = dao.getDamageApplication(appId);


            // 처리 기간 계산
			Long dffDay = calculateDays(compensationClaim.getClaimDate(), compensationSummary.getPaymentCompletionDate());

			request.setAttribute("compensationSummary", compensationSummary);
			request.setAttribute("compensationSummaryDffDay", dffDay);
			request.setAttribute("compensationClaim", compensationClaim);
			request.setAttribute("damageActionSummary", damageActionSummary);
			request.setAttribute("damageApplication", damageApplication);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "view/compensationResultDetail.jsp";
	}

    // 처리 기간 계산
	private Long calculateDays(Date startDate, Date endDate) {

	    if (startDate == null || endDate == null) {
	        return null;
	    }

	    long diffMillis = endDate.getTime() - startDate.getTime();

	    return diffMillis / (1000L * 60 * 60 * 24);
	}

}
