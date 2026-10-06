package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import model.dao.CompensationListDAO;

public class CompensationListUIAction implements Action{

	@Override
	public String execute(HttpServletRequest request) throws ServletException, IOException {
		
//		CompensationListDAO dao = new CompensationListDAO();
//
//        List<CompensationResultDTO> compensationList =
//                dao.getCompensationResultList();
//
//        request.setAttribute(
//                "compensationList",
//                compensationList
//        );
//
//        return "/WEB-INF/views/compensation/compensationResultList.jsp";
//		
//		return "view/compensationList.jsp";
		return null;
	}

}
