package semidemo.loginAction;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.MemberDAO;
import semidemo.dto.MemberDTO;

@WebServlet("/mammaMain/FindPasswordServlet")
public class FindPasswordController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req,resp);
	}
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 한글깨짐안되도록 설정
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		String find_id = req.getParameter("find_id");
		String findPass_Ques = req.getParameter("findPass_Ques");
		String find_a = req.getParameter("find_a");
		
		MemberDAO dao = MemberDAO.getInstance();
		System.out.println(find_id+"  "+findPass_Ques+"  "+find_a);
		
		
		String res = dao.findPassword(find_id, findPass_Ques, find_a);
		System.out.println(res);
		resp.getWriter().write(res + "");

	}//end doProcess()////////////////////
	
}//end class






















