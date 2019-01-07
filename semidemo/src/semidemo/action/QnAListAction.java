package semidemo.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.QnaDAO;
import semidemo.dto.QnaDTO;

public class QnAListAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		QnaDAO dao = QnaDAO.getInstance();
		List<QnaDTO> list = dao.listMethod();
		req.setAttribute("list", list);
	}//end execute()////////////////////////////////////////
}//end class
