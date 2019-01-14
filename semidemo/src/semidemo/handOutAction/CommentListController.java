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

@WebServlet("/mammaMain/handOutCommentList")
public class CommentListController extends HttpServlet{

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
		
		Handout_commDAO dao = Handout_commDAO.getInstance();
		List<Handout_commDTO> list = dao.comm_viewMethod(handout_post_num);
		
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj = null;
		
		for(Handout_commDTO dto :list) {
			jsonObj = new JSONObject();
			jsonObj.put("handout_comm_num", dto.getHandout_comm_num());
			jsonObj.put("nickname", dto.getNickname());
			jsonObj.put("write_time", dto.getWrite_time().toString());
			jsonObj.put("content", dto.getContent());
			jsonObj.put("image", dto.getImage());
			jsonArr.add(jsonObj);
		}
		
		
		
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(jsonArr);
		
		
		
		
	
	}

	
}
