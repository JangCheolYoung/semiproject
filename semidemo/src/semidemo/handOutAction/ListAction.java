package semidemo.handOutAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_postDAO;
import semidemo.dto.Handout_postDTO;
import semidemo.dto.PageDTO;



public class ListAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String pageNum = req.getParameter("pageNum");
		if(pageNum==null || pageNum.equals("null")) {
			pageNum="1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		
		Handout_postDAO dao = Handout_postDAO.getInstance();
		int cnt = dao.rowTotalCount();
		
		
		if(cnt>0) {
			PageDTO pdto = new PageDTO(currentPage, cnt);
			req.setAttribute("pdto", pdto);
			req.setAttribute("aList", dao.listMethod(pdto));
		}
	
		
		
		
	}//end execute()///////
}
