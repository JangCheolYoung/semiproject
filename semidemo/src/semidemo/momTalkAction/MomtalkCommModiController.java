package semidemo.momTalkAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Momtalk_postDAO;

@WebServlet("/mammaMain/MomtalkCommListModi")
public class MomtalkCommModiController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("MomtalkCommModi In");
		
		int momtalk_comm_num = Integer.parseInt(req.getParameter("momtalk_comm_num"));
		int momtalk_post_num = Integer.parseInt(req.getParameter("momtalk_post_num"));
		String content = req.getParameter("content");
		
		//확인용
		System.out.println("momtalk_comm_num : " + momtalk_comm_num);
		System.out.println("momtalk_post_num : " + momtalk_post_num);
		System.out.println("content : " + content);
		
		Momtalk_postDAO dao = Momtalk_postDAO.getInstance();
		dao.commModiMethod(content, momtalk_comm_num);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(momtalk_post_num);
		
		
	}//end doPost()///////////////////////////////
}//end class
