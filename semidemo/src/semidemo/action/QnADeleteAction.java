package semidemo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.QnaDAO;

public class QnADeleteAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int qna_num = Integer.parseInt(req.getParameter("qna_num"));
		
		QnaDAO dao = QnaDAO.getInstance();
		dao.qnaDeleteMethod(qna_num);
		
		
	}//end execute()/////////////////////////////////////////
}
