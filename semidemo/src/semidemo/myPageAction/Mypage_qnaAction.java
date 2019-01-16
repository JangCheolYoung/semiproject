package semidemo.myPageAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.MypageDAO;
import semidemo.dto.Mypage_PageDTO;

public class Mypage_qnaAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null || pageNum.equals("null")) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		MypageDAO dao = MypageDAO.getInstance();
		int cnt = dao.qrowTotalCount();
		System.out.println("qnaAction cnt"+ cnt);
		
		if(cnt>0) {
			Mypage_PageDTO pdto = new Mypage_PageDTO(currentPage, cnt);
			req.setAttribute("pdto", pdto);
			req.setAttribute("qList", dao.qlistMethod(pdto));
		}
	}
}
