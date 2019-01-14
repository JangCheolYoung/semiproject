package semidemo.handOutAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_postDAO;
import semidemo.dto.Handout_postDTO;

public class UpdateFormAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		//handoutview.jsp에서 넘어온 num이라는 값을 받아옴
		int num = Integer.parseInt(req.getParameter("handout_post_num"));
	
		Handout_postDAO dao = Handout_postDAO.getInstance();
		Handout_postDTO dto = dao.viewMethod(num);
		req.setAttribute("dto", dto);
	}
}
