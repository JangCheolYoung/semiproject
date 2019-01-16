package semidemo.momTalkAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Momtalk_postDAO;

@WebServlet("/mammaMain/returnLikeCnt")
public class MomtalkPostReturnLikeCntController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
System.out.println("MomtalkPostReturnLikeCnt In");
		
		int momtalk_post_num = Integer.parseInt(req.getParameter("momtalk_post_num"));
		
		//확인용
		System.out.println("momtalk_post_num : " + momtalk_post_num);
		
		Momtalk_postDAO dao = Momtalk_postDAO.getInstance();
		int like_cnt = dao.returnLikeCntMethod(momtalk_post_num);
		
		System.out.println("like_cnt : " + like_cnt);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(like_cnt);
		
	}//end doGet()////////////////////////////////////////////
}//end class
