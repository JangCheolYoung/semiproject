package semidemo.loginAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semidemo.dao.MemberDAO;
import semidemo.dto.MemberDTO;

public class LoginAction {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		String id = req.getParameter("id");
		String password = req.getParameter("password");
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPassword(password);
		
		MemberDAO dao= MemberDAO.getInstance();
		
		int check = dao.loginCheck(id, password);//cnt값 받아와서 cnt값이 몇개인지 출력해볼수 있다.
		dto = dao.getMemberList_From_id(id);
		HttpSession session = req.getSession();
		PrintWriter out=resp.getWriter();
		resp.setContentType("text/html; charset=UTF-8");
		//페이지 이동되는 듯한 느낌 해결.. / 포커스
		if(check==1) {
			System.out.println("로그인 성공!");
			session.setAttribute("logOk", id); //세션 스코프에다가 logok라는 이름으로 회원의 아이디 값을 저장시킨다.
			
			session.setAttribute("id", id);
			session.setAttribute("nickname", dto.getNickname());
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("gender", dto.getGender());
			
			
			session.setMaxInactiveInterval(30*60);//로그인 해놓고 아무 활동도 안하면 30분 뒤에 로그아웃이 되는 거.
			
			RequestDispatcher dis = req.getRequestDispatcher("/semiview/main/semimain.jsp");
			dis.forward(req, resp);
			
		}else if(check==0) {
			System.out.println("비밀번호 틀림!");
			out.println("<script> alert('비밀번호를 확인해주세요.'); </script>");
			out.println("<script> history.back(); </script>");
			out.println("<script> location.reload(); </script>");

		}else if(check==-1) {
			System.out.println("아이디 없음!");
			out.println("<script> alert('존재하지 않는 아이디입니다.'); </script>");
			out.println("<script> history.back(); </script>");
			out.println("<script> location.reload(); </script>");
		}
		
	}//end execute()//////////////
	
}//end class
