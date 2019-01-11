package semidemo.qnaAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.QnaDAO;
import semidemo.dto.QnaDTO;
import semidemo.dto.QnaPageDTO;

public class QnAListAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {

		// pageNum에 현재페이지값(currentPage)을 넣어 넘겨준다.
		//
		String pageNum = req.getParameter("pageNum");

		// 처음 실행할때는 null값으로 넘어오기 때문에 이에 대한 처리이다.
		// 나머지 경우는 페이지를 이동하며 값을 받아옴
		if (pageNum == null || pageNum.equals("null")) { // 문자열값이 null로 넘어가기 때문에 pageNum.equals("")가 아니라 pageNum.equals("null")로 처리해야한다
			pageNum = "1";
		}

		int currentPage = Integer.parseInt(pageNum); // QnaPageDTO에서 int값으로 사용하므로 String값으로 받은 파라미터값을 int로 바꾸어줌

		QnaDAO dao = QnaDAO.getInstance();
		//List<QnaDTO> list = dao.listMethod();

		int cnt = dao.qnaRowTotalCount(); // 2019-01-08 19:30 현재 12개

		// 총레코드수가 0이면 작업을 할 필요가 없음
		// 0보다 큰경우에만 실행을 하도록 함
		if (cnt > 0) {
			QnaPageDTO pdto = new QnaPageDTO(currentPage, cnt); // 현재페이지, 전체레코드수 값을 넘겨주면 PageDTO생성자 내부에서 필요한 값들이 계산이 됨
			// 총페이지수, 시작레코드, 끝레코드, 시작페이지, 끝페이지 값이 계산됨
			// 리퀘스트 영역에 저장
			req.setAttribute("pdto", pdto);
			//req.setAttribute("list", list);
			req.setAttribute("list", dao.listMethod(pdto));
		}

	}// end execute()////////////////////////////////////////
}// end class
