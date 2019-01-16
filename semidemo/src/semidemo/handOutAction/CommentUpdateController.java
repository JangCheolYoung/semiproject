package semidemo.handOutAction;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_commDAO;
import semidemo.dto.Handout_commDTO;



@WebServlet("/mammaMain/handOutCommentUpdate")
public class CommentUpdateController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int handout_post_num = Integer.parseInt(req.getParameter("handout_post_num"));
		int handout_comm_num = Integer.parseInt(req.getParameter("handout_comm_num"));
		String comm_content = req.getParameter("comm_content");
		
		System.out.println("handout_post_num = "+handout_post_num);
		System.out.println("handout_comm_num = "+handout_comm_num);
		System.out.println("comm_content = "+comm_content);
		
				
		Handout_commDAO dao = Handout_commDAO.getInstance();
		//Handout_commDTO dto = new Handout_commDTO();
		
		//dto.setHandout_comm_num(handout_comm_num);
		//dto.setContent(content);
		//dao.comm_UpdateMethod(dto);
		
		dao.comm_UpdateMethod(handout_comm_num, comm_content);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(handout_post_num);
		
		
	}//end doPost()//////////////////
}
