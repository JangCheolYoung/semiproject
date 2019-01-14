package semidemo.momTalkAction;

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

import semidemo.dao.Momtalk_postDAO;
import semidemo.dto.Momtalk_commDTO;

@WebServlet("/mammaMain/MomtalkCommList")
public class MomTalkCommListController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("MomTalkCommList In");
		
		int momtalk_post_num = Integer.parseInt(req.getParameter("momtalk_post_num"));
		System.out.println(momtalk_post_num);
		
		
		Momtalk_postDAO dao = Momtalk_postDAO.getInstance();
		List<Momtalk_commDTO> aList = dao.commListMethod(momtalk_post_num);

		
		//json으로 넘겨주기 위한 과정
		JSONArray arr = new JSONArray();
		for(Momtalk_commDTO dto : aList) {
			JSONObject obj = new JSONObject();
			obj.put("nickname", dto.getNickname());
			obj.put("write_time", dto.getWrite_time().toString());
			obj.put("content", dto.getContent());
			obj.put("momtalk_comm_num", dto.getMomtalk_comm_num());

			arr.add(obj); //object를 배열에 넣어줌
		}
		
		//json 타입으로 보내야함, text를 json으로 파싱하라고 브라우저에 알려주어야함
		resp.setContentType("text/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.println(arr);
		
		//확인용
		System.out.println(arr);
		
	}//end doGet()///////////////////////////////////////////////////////////
	
}//end class
