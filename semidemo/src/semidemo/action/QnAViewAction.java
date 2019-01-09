package semidemo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.QnaDAO;
import semidemo.dto.QnaDTO;

public class QnAViewAction {
	
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int qna_num = Integer.parseInt(req.getParameter("qna_num"));
		
		QnaDAO dao = QnaDAO.getInstance();
		dao.readCountMethod(qna_num);
		req.setAttribute("dto", dao.qnaViewMethod(qna_num));
		
		
	}//end execute()/////////////////////////////////////////
	
}//end class////////////////////////////////////////////////
