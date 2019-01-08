package semidemo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.QnaDAO;
import semidemo.dto.QnaDTO;

public class QnAViewAction {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int num = Integer.parseInt(req.getParameter("qna_num"));
		
		
		QnaDAO dao = QnaDAO.getInstance();
		QnaDTO dto = dao.qnaViewMethod(num);
		req.setAttribute("dto", dto);
		
		
	}//end execute()/////////////////////////////////////////
	
	public String strContent(HttpServletRequest req, HttpServletResponse resp) {
		String str=null;
		int num = Integer.parseInt(req.getParameter("qna_num"));
		
		
		QnaDAO dao = QnaDAO.getInstance();
		QnaDTO dto = dao.qnaViewMethod(num);
		str= dto.getContent();
		System.out.println("strContent method = "+str);
		
		return str;
	}

}//end class////////////////////////////////////////////////
