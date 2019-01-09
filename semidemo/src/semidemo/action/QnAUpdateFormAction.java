package semidemo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.QnaDAO;
import semidemo.dto.QnaDTO;

public class QnAUpdateFormAction {

	public void execute(HttpServletRequest req, HttpServletResponse reps) {
		
		int qna_num = Integer.parseInt(req.getParameter("qna_num"));
		
		QnaDAO dao = QnaDAO.getInstance();
		QnaDTO dto = dao.qnaViewMethod(qna_num);
		
		req.setAttribute("dto", dto);
	}
}
