package semidemo.handOutAction;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_commDAO;

@WebServlet("/mammaMain/handOutCommentDelete")
public class CommentDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int handout_post_num = Integer.parseInt(req.getParameter("handout_post_num"));
		int handout_comm_num = Integer.parseInt(req.getParameter("handout_comm_num"));
		
		
				
		
		Handout_commDAO dao = Handout_commDAO.getInstance();
		dao.comm_deleteMethod(handout_comm_num);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(handout_post_num);
	}//end doGet()//////////////////////////
}
