package servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Controller가 JSP로 forward하는 요청에는 적용하지 않는다.
@WebFilter(urlPatterns = {"/view/compensationResultList.jsp", "/view/compensationResultDetail.jsp"},
        dispatcherTypes = DispatcherType.REQUEST)
public class CompensationViewFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        resp.setHeader("Cache-Control", "no-store");
        req.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("loginOK") == null) {
            resp.sendRedirect(req.getContextPath() + "/controller?cmd=qualityOfficerLoginUI");
            return;
        }

        boolean isDetail = req.getServletPath().endsWith("compensationResultDetail.jsp");
        StringBuilder target = new StringBuilder(req.getContextPath())
                .append("/controller?cmd=")
                .append(isDetail ? "compensationDetailAction" : "compensationListUI");
        String[] parameters = isDetail ? new String[] {"appId"}
                : new String[] {"startDate", "endDate", "appId", "organizationName",
                        "representativeName", "appCategory", "productName"};
        for (String parameter : parameters) {
            String value = req.getParameter(parameter);
            if (value != null && !value.isBlank()) {
                target.append('&').append(parameter).append('=')
                        .append(URLEncoder.encode(value, StandardCharsets.UTF_8));
            }
        }
        // 직접 JSP에 진입해도 Action에서 데이터를 준비하도록 정식 경로로 이동한다.
        resp.sendRedirect(target.toString());
    }
}
