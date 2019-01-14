package semidemo.handOutAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_postDAO;

public class ViewAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
	      int num = Integer.parseInt(req.getParameter("handout_post_num"));
	      
	      
	      Handout_postDAO dao = Handout_postDAO.getInstance();
	      
	      dao.readCountMethod(num);
	      
	      req.setAttribute("dto", dao.viewMethod(num));
	      
	      
	   }// end execute()/////////////////////////////////////////////////
}
