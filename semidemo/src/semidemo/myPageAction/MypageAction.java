package semidemo.myPageAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.MemberDAO;
import semidemo.dao.QnaDAO;
import semidemo.dto.MemberDTO;

public class MypageAction{
	
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
		
		int qna_num = Integer.parseInt(req.getParameter("qna_num"));
		
		QnaDAO dao1 = QnaDAO.getInstance();
		dao1.readCountMethod(qna_num);
		req.setAttribute("dto", dao1.qnaViewMethod(qna_num));
	}
}