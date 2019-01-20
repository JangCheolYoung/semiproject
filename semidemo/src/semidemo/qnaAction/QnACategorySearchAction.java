package semidemo.qnaAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.QnaDAO;
import semidemo.dto.QnaDTO;
import semidemo.dto.QnaPageDTO;

public class QnACategorySearchAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String category = req.getParameter("category");
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("null")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); 

		QnaDAO dao = QnaDAO.getInstance();

		int cnt = dao.qnaRowTotalCount(); // 2019-01-08 19:30 현재 12개

		// 총레코드수가 0이면 작업을 할 필요가 없음
		// 0보다 큰경우에만 실행을 하도록 함
		if (cnt > 0) {
			QnaPageDTO pdto = new QnaPageDTO(currentPage, cnt); // 현재페이지, 전체레코드수 값을 넘겨주면 PageDTO생성자 내부에서 필요한 값들이 계산이 됨
			// 총페이지수, 시작레코드, 끝레코드, 시작페이지, 끝페이지 값이 계산됨
			// 리퀘스트 영역에 저장
			req.setAttribute("pdto", pdto);
			//req.setAttribute("list", list);
			List<QnaDTO> list = dao.categoryListMethod(pdto, "육아정보");
			req.setAttribute("list", list);
		}
		
		
		
	}//end execute()/////////////////////////////////////////
}
