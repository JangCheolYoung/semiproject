package semidemo.loginAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.MemberDAO;
import semidemo.dto.MemberDTO;

public class IdDupChkAction {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		String id = req.getParameter("id");
		
		MemberDAO dao= MemberDAO.getInstance();
		
		boolean result = dao.IdDupChk(id);
		
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		if(result) 	
			out.println("0");//아이디중복
		else	
			out.println("1");
		
		out.close();
		/*int cnt = dao.idDupChk(id);//cnt값 받아와서 cnt값이 몇개인지 출력해볼수 있다.
		
		PrintWriter out=resp.getWriter();
		resp.setContentType("text/html; charset=UTF-8");
		
		if(cnt==0) {
			System.out.println("중복아님! 아이디 사용가능!");
			out.println("<script> alert('사용가능한 아이디입니다.'); </script>");
			
			
		}else if(cnt==1) {
			System.out.println("중복임! 아이디 사용불가!");
			out.println("<script> alert('이미 존재하는 아이디입니다.'); </script>");
			out.println("<script> location.reload(); </script>");
		}*/
		
	}//end IdDupChkAction()////////////////////////////
	
}//end class