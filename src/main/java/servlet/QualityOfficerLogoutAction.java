package servlet;

import javax.servlet.http.HttpServletRequest;

public class QualityOfficerLogoutAction implements Action {
    @Override
    public String execute(HttpServletRequest request) {
        if (request.getSession(false) != null) {
            request.getSession(false).invalidate();
        }
        return "view/qualityOfficerLogin.jsp";
    }
}
