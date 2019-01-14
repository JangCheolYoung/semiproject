package semidemo.handOutAction;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.Handout_postDAO;

public class DeleteAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// num에 해당하는 레코드를 삭제하기 전에 첨부파일이 있으면 첨부파일을 먼저 삭제해야 한다.
		// 저장 장소
		String saveDirectory = "C:\\study\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semidemo\\semiview\\images\\handout";
		Handout_postDAO dao = Handout_postDAO.getInstance();
		
		//넘어오는 handout_post_num 값 받아온다.
		int handout_post_num = Integer.parseInt(req.getParameter("handout_post_num"));
		//메인 이미지 삭제
		String main_filename = dao.fileMethod(handout_post_num);
		//서브 이미지 삭제
		String sub_filename1 = dao.fileMethod1(handout_post_num);
		String sub_filename2 = dao.fileMethod2(handout_post_num);
		String sub_filename3 = dao.fileMethod3(handout_post_num);
		
		if(main_filename != null) {
			//파일네임이 0이 아니면 첨부파일이 있는 경우, 첨부파일 먼저 삭제한다.
			File file = new File(saveDirectory, main_filename);
			file.delete();
		}
		
		if(sub_filename1 != null) {
			//파일네임이 0이 아니면 첨부파일이 있는 경우, 첨부파일 먼저 삭제한다.
			File file1 = new File(saveDirectory, sub_filename1);
			file1.delete();
		}
		
		if(sub_filename2 != null) {
			//파일네임이 0이 아니면 첨부파일이 있는 경우, 첨부파일 먼저 삭제한다.
			File file2 = new File(saveDirectory, sub_filename2);
			file2.delete();
		}
		
		if(sub_filename3 != null) {
			//파일네임이 0이 아니면 첨부파일이 있는 경우, 첨부파일 먼저 삭제한다.
			File file3 = new File(saveDirectory, sub_filename3);
			file3.delete();
		}
		
		
		//////////////////////////////////////////////////////////
		// handout_post_num 가지고 해당 게시물의 댓글 전체 삭제.
		dao.comm_allDeleteMethod(handout_post_num);
		
		
		//////////////////////////////////////////////////////////
	
		
		//첨부파일 삭제 완료한 경우 handout_post_num 에 해당하는 레코드 값을 삭제한다.
		dao.deleteMethod(handout_post_num);
	}
}
