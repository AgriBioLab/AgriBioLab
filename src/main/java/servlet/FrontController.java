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
		
		// 해당 Action을 전달 받아서 실행 TDD 
		Action action = ActionFactory.getAction(cmd);
		
		// 해당 페이지로 이동
		String url = action.execute(req);
		System.out.println("반환 url: " + url);
		if(url != null) {
			req.getRequestDispatcher("/"+url).forward(req, resp);
		}
	}

}
