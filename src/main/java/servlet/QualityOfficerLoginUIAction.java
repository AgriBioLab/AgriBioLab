package servlet;

import javax.servlet.http.HttpServletRequest;

public class QualityOfficerLoginUIAction implements Action {
    @Override
    public String execute(HttpServletRequest request) {
        return "view/qualityOfficerLogin.jsp";
    }
}
