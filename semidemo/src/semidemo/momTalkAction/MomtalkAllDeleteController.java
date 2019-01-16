package semidemo.momTalkAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Momtalk_postDAO;

@WebServlet("/mammaMain/MomtalkAllDelete")
public class MomtalkAllDeleteController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("deleteIN");
		//String del = req.getParameter("momtalk_post_num");
		int momtalk_post_num = Integer.parseInt(req.getParameter("momtalk_post_num"));
		System.out.println(momtalk_post_num);
		
		Momtalk_postDAO dao = Momtalk_postDAO.getInstance(); //전체 검색해올 dao
		
		//해당 게시물에 있는 댓글들도 모두 삭제
		dao.commAllDeleteMethod(momtalk_post_num);
		
		//momtalk 테이블에 저장되어 있는 해당 num값 게시물 삭제
		dao.deleteMethod(momtalk_post_num);
		
		/*resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(momtalk_post_num);*/
		resp.sendRedirect("momTalk.do");
		
	}//end doGet()///////////////////////////////////////////
}//end class
