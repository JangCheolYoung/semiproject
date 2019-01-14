package semidemo.handOutAction;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import semidemo.dao.Handout_commDAO;
import semidemo.dto.Handout_commDTO;


@WebServlet("/mammaMain/handOutCommentInsert")
public class CommentInsertController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int handout_post_num = Integer.parseInt(req.getParameter("handout_post_num"));
		
		
		String nickname = req.getParameter("nickname");
		String comment_content = req.getParameter("comment_content");
		String image = req.getParameter("image");
		
		Handout_commDAO dao = Handout_commDAO.getInstance();
		Handout_commDTO dto = new Handout_commDTO();
		
		dto.setHandout_post_num(handout_post_num);
		dto.setNickname(nickname);
		dto.setContent(comment_content);
		dto.setImage(image);
		dao.comm_insertMethod(dto);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(handout_post_num);
		
		
		
		
	
	}

	
}
