package semidemo.momTalkAction;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Momtalk_postDAO;
import semidemo.dto.Momtalk_postDTO;

@WebServlet("/MomTalkPostView")
public class MomTalkPostViewAction extends HttpServlet{
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("viewIN");
		
		Momtalk_postDAO dao = Momtalk_postDAO.getInstance(); //전체 검색해올 dao
		List<Momtalk_postDTO> aList = new ArrayList<Momtalk_postDTO>(); //받아온 값들을 리스트에 저장
		
		//momtalk 테이블에 저장되어 있는 모든 값 가지고 오기
		aList = dao.searchAll();
		
		//전체 게시물 정보 리퀘스트 영역에 저장
		req.setAttribute("aList", aList);
		
	}//end execute()/////////////////////////////////////////
	
}//end class
