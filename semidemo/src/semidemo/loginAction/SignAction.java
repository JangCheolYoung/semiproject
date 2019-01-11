package semidemo.loginAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.MemberDAO;
import semidemo.dto.MemberDTO;

public class SignAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO dto = new MemberDTO();
		
		dto.setNickname(req.getParameter("nickname"));
		dto.setId(req.getParameter("id"));
		dto.setPassword(req.getParameter("password"));
		dto.setEmail(req.getParameter("email"));
		dto.setGender(req.getParameter("gender"));
		dto.setPass_ques(req.getParameter("pass_ques"));
		dto.setPass_answ(req.getParameter("pass_answ"));
		/*dto.setCnt(Integer.parseInt(req.getParameter("cnt")));*/
		dto.setGrade(req.getParameter("grade"));
		
		dao.insertMember(dto);
		
	}//end execute()//////////////////////////////////////////////
}
