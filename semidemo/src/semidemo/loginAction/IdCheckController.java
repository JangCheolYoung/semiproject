package semidemo.loginAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.MemberDAO;

@WebServlet("/mammaMain/IdCheckServlet")
public class IdCheckController extends HttpServlet {

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

		String id = req.getParameter("id");
		String res = null;
		MemberDAO dao = MemberDAO.getInstance();
		boolean chk = dao.IdDupChk(id);
		if (chk == true) {
			// chk= true =>> 디비에 아이디가 존재한다. 가입 불가능.
			res = "fail";
		} else if (chk == false) {
			// chk= false =>> 디비에 존재하지 않는다. 가입가능
			res = "success";
		}
		resp.getWriter().write(res + "");
	}
}
