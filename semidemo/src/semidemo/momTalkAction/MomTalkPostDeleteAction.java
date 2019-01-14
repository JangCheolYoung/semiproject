package semidemo.momTalkAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Momtalk_postDAO;
import semidemo.dto.Momtalk_postDTO;

public class MomTalkPostDeleteAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("deleteIN");
		//String del = req.getParameter("momtalk_post_num");
		int delNum = Integer.parseInt(req.getParameter("momtalk_post_num"));
		System.out.println(delNum);
		
		Momtalk_postDAO dao = Momtalk_postDAO.getInstance(); //전체 검색해올 dao
		
		//momtalk 테이블에 저장되어 있는 해당 num값 게시물 삭제
		dao.deleteMethod(delNum);
		
		//해당 게시물에 있는 댓글들도 모두 삭제
		dao.commAllDeleteMethod(delNum);
		
	}//end execute()/////////////////////////////////////////
}//end class
