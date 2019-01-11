package semidemo.loginAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semidemo.dao.MemberDAO;

public class LogoutAction {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session=req.getSession();
		MemberDAO dao = MemberDAO.getInstance();
		PrintWriter out=resp.getWriter();
		resp.setContentType("text/html; charset=UTF-8");
		String id=(String)session.getAttribute("logOk");
		
		if(id!=null) {
			System.out.println("로그아웃 알림!");
			out.println("<script> alert('정말로 로그아웃 하시겠습니까?'); </script>");//이게 안됨!!!!! confirm()로 바꾸고 실행되게
			
			//세션 연결 종료
			session.invalidate();
			System.out.println("세션 연결 종료!");
			
		}
		//resp.sendRedirect("main.do");//다시 메인 페이지로 가야되므로 이렇게 해준다.
	
	}
	
}//end class
