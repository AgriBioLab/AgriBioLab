package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/controller")
public class FrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// 1. Cmd 값 (Url - Request)
		String cmd = req.getParameter("cmd");

		// 2. 해당 Action 전달 받아서 실행 / Action을 팩토리에서 받아서 실행
		Action action = ActionFactory.getAction(cmd);

		// 3. 해당 페이지로 이동 
		String url = action.execute(req);
		req.getRequestDispatcher("/" + url).forward(req, resp);

	}

}
