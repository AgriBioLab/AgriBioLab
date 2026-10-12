package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/controller")
public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setHeader("Cache-Control", "no-store");
		
		// cmd
		String cmd = req.getParameter("cmd");
		
		// 로그인하지 않아도 접근할 수 있는 cmd
		boolean isLoginRequest = "qualityOfficerLoginUI".equals(cmd) || "qualityOfficerLoginAction".equals(cmd);

		// 로그인 여부 확인
		if (!isLoginRequest) {
			HttpSession session = req.getSession(false);

			// 세션이 없거나 로그인 정보가 없으면 로그인 화면으로 이동
			if (session == null || session.getAttribute("loginOK") == null) {
				resp.sendRedirect(req.getContextPath() + "/controller?cmd=qualityOfficerLoginUI");

				return;
				}
			}
		
		// 로그인 상태에서 기본 진입 요청은 목록으로 안내한다.
		if (cmd == null || cmd.isBlank()) {
			resp.sendRedirect(req.getContextPath() + "/controller?cmd=compensationListUI");
			return;
		}

		Action action = ActionFactory.getAction(cmd);
		if (action == null) {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND, "요청한 화면을 찾을 수 없습니다.");
			return;
		}
		
		// 해당 페이지로 이동
		String url = action.execute(req);
		if (url != null) {
		    if ("REDIRECT:/controller?cmd=compensationListUI".equals(url)) {
		        resp.sendRedirect(
		            req.getContextPath() + "/controller?cmd=compensationListUI"
		        );
		    } else {
		        req.getRequestDispatcher("/" + url).forward(req, resp);
		    }
		}
	}

}
