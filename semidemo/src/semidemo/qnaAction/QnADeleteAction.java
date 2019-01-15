package semidemo.qnaAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.QnaDAO;

public class QnADeleteAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		int qna_num = Integer.parseInt(req.getParameter("qna_num"));
		int ref = Integer.parseInt(req.getParameter("ref"));
		
		QnaDAO dao = QnaDAO.getInstance();
		if(qna_num == ref) {
			dao.qnaDeleteMethod(qna_num);
			
		}else if(qna_num !=ref){
			dao.answDeleteMethod(qna_num);
		}
		
		
		
	}//end execute()/////////////////////////////////////////
}
