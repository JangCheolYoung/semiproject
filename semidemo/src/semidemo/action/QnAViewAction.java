package semidemo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.QnaDAO;
import semidemo.dto.QnaDTO;

public class QnAViewAction {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int num = Integer.parseInt(req.getParameter("qna_num"));
		
		
		QnaDAO dao = QnaDAO.getInstance();
		req.setAttribute("dto", dao.qnaViewMethod(num));
		
		
	}//end execute()/////////////////////////////////////////
	
}//end class////////////////////////////////////////////////
