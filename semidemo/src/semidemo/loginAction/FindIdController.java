package semidemo.loginAction;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.MemberDAO;
import semidemo.dto.MemberDTO;

@WebServlet("/mammaMain/FindIdServlet")
public class FindIdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);

	}

	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 한글깨짐안되도록 설정
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		String emailAdd = req.getParameter("emailAdd");
		MemberDAO dao = MemberDAO.getInstance();
		
		String res = dao.findId2(emailAdd);
		
		resp.getWriter().write(res + "");

	}//end doProcess()////////////////////
}//end class

