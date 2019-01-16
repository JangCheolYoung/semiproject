package semidemo.momTalkAction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Momtalk_postDAO;
import semidemo.dto.Momtalk_commDTO;

@WebServlet("/mammaMain/MomtalkCommInput")
public class MomTalkCommInputController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("MomtalkCommInput In");
		
		int momtalk_post_num = Integer.parseInt(req.getParameter("momtalk_post_num"));
		String content = req.getParameter("content");
		String nickname = req.getParameter("nickname");
		
		//확인용
		System.out.println("momtalk_post_num : " + momtalk_post_num);
		System.out.println("content : " + content);
		System.out.println("nickname : " + nickname);
		
		Momtalk_postDAO dao = Momtalk_postDAO.getInstance();
		Momtalk_commDTO dto = new Momtalk_commDTO();
		
		dto.setMomtalk_post_num(momtalk_post_num);
		dto.setContent(content);
		dto.setNickname(nickname);
		
		System.out.println("In MomTalkCommInputController : "+dto.getContent());
		
		dao.commInputMethod(dto);
		
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		out.print(momtalk_post_num);
		
	}//end doPost()/////////////////////////////////
	
}//end class
