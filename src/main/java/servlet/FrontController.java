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
		req.setCharacterEncoding("utf-8");
		
		// cmd
		String cmd = req.getParameter("cmd");
		
		// 해당 Action을 전달 받아서 실행 TDD 
		Action action = ActionFactory.getAction(cmd);
		
		// 해당 페이지로 이동
		String url = action.execute(req);
		req.getRequestDispatcher("/"+url).forward(req, resp);
		
	}

}
