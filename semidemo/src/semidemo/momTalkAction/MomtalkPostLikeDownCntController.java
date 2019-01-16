package semidemo.momTalkAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Momtalk_postDAO;

@WebServlet("/mammaMain/likeDownCnt")
public class MomtalkPostLikeDownCntController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("MomtalkPostLikeDown In");
		
		int momtalk_post_num = Integer.parseInt(req.getParameter("momtalk_post_num"));
		
		//확인용
		System.out.println("momtalk_post_num : " + momtalk_post_num);
		
		Momtalk_postDAO dao = Momtalk_postDAO.getInstance();
		dao.likeDownCntMethod(momtalk_post_num);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(momtalk_post_num);
		
	}//end doGet()//////////////////////////////////////////////
}//end class
