package semidemo.handOutAction;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semidemo.dao.Handout_postDAO;
import semidemo.dto.Handout_postDTO;

public class UpdateProAction {
	public MultipartRequest excute(HttpServletRequest req, HttpServletResponse resp) {
		MultipartRequest multi = null;
		String saveDirectory = "C:\\study\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semidemo\\semiview\\images\\handout"; // 저장 장소

		File file = new File(saveDirectory);
		if (!file.exists())// 파일이 존재하지 않으면
			file.mkdir(); // 파일생성, 패키지가 여러개이면 mkdirs로 생성
		int maxPostSize = 1000000000;
		String encoding = "UTF-8";

		try {
			// 리퀘스트, 첨부파일저장장소, 최대크기, 한글인코딩, 중복명제거(서버에 이미 존재되는 파일명이 있는 경우 번호를 붙여서 구분)
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Handout_postDAO dao = Handout_postDAO.getInstance();
		Handout_postDTO dto = new Handout_postDTO();
		int num = Integer.parseInt(multi.getParameter("handout_post_num"));
		
		//메인이미지
		String main_filename = dao.fileMethod(num);
		//서브이미지1
		String sub_filename1 = dao.fileMethod1(num);
		//서브이미지2
		String sub_filename2 = dao.fileMethod2(num);
		//서브이미지3
		String sub_filename3 = dao.fileMethod3(num);
		
				
		//수정 첨부파일이 있으면 (새로운 첨부파일이 있으면)
		if(multi.getFilesystemName("mainfile") != null) {
			//서버에 있는 기존 첨부파일을 삭제해 주어야 한다.
			//기존 첨부파일이 있으면
			if(main_filename != null) {
				//handout_post 테이블의 첨부파일을 삭제
				File oldFile = new File(saveDirectory, main_filename);
				oldFile.delete(); //saveDirectory에 있는 main_filename의 첨부파일이 삭제가 됨
			}
			
			//기존의 첨부파일이 없는 경우에도 새로운 첨부파일을 넣어주어야함
		    //새로운 첨부파일을 넣어줌
			dto.setMain_picture(multi.getFilesystemName("mainfile"));
					
		}else {
			//수정 첨부파일이 없으면 (새로운 첨부파일이 없으면)
			//기존의 첨부파일 값을 위에서 무조건 한번 가지고 오도록 되어 있으므로 다시 넣어주는 형태로 수행
			if(main_filename != null) { //기존 첨부파일이 있으면
				dto.setMain_picture(main_filename);
			}
		}
		////////////////////////////////////////////////////////////////////////////////////////
		
		if(multi.getFilesystemName("file1") != null) {
			//서버에 있는 기존 첨부파일을 삭제해 주어야 한다.
			//기존 첨부파일이 있으면
			if(sub_filename1 != null) {
				//handout_post 테이블의 첨부파일을 삭제
				File sub_oldFile1 = new File(saveDirectory, sub_filename1);
				sub_oldFile1.delete(); //saveDirectory에 있는 main_filename의 첨부파일이 삭제가 됨
			}
			
			//기존의 첨부파일이 없는 경우에도 새로운 첨부파일을 넣어주어야함
		    //새로운 첨부파일을 넣어줌
			dto.setPicture1(multi.getFilesystemName("file1"));
					
		}else {
			//수정 첨부파일이 없으면 (새로운 첨부파일이 없으면)
			//기존의 첨부파일 값을 위에서 무조건 한번 가지고 오도록 되어 있으므로 다시 넣어주는 형태로 수행
			if(sub_filename1 != null) { //기존 첨부파일이 있으면
				dto.setPicture1(sub_filename1);
			}
		}
		/////////////////////////////////////////////////////////////////////
		if(multi.getFilesystemName("file2") != null) {
			//서버에 있는 기존 첨부파일을 삭제해 주어야 한다.
			//기존 첨부파일이 있으면
			if(sub_filename2 != null) {
				//handout_post 테이블의 첨부파일을 삭제
				File sub_oldFile2 = new File(saveDirectory, sub_filename2);
				sub_oldFile2.delete(); //saveDirectory에 있는 main_filename의 첨부파일이 삭제가 됨
			}
			
			//기존의 첨부파일이 없는 경우에도 새로운 첨부파일을 넣어주어야함
		    //새로운 첨부파일을 넣어줌
			dto.setPicture2(multi.getFilesystemName("file2"));
					
		}else {
			//수정 첨부파일이 없으면 (새로운 첨부파일이 없으면)
			//기존의 첨부파일 값을 위에서 무조건 한번 가지고 오도록 되어 있으므로 다시 넣어주는 형태로 수행
			if(sub_filename2 != null) { //기존 첨부파일이 있으면
				dto.setPicture2(sub_filename2);
			}
		}
		///////////////////////////////////////////////////////////////
		if(multi.getFilesystemName("file3") != null) {
			//서버에 있는 기존 첨부파일을 삭제해 주어야 한다.
			//기존 첨부파일이 있으면
			if(sub_filename3 != null) {
				//handout_post 테이블의 첨부파일을 삭제
				File sub_oldFile3 = new File(saveDirectory, sub_filename3);
				sub_oldFile3.delete(); //saveDirectory에 있는 main_filename의 첨부파일이 삭제가 됨
			}
			
			//기존의 첨부파일이 없는 경우에도 새로운 첨부파일을 넣어주어야함
		    //새로운 첨부파일을 넣어줌
			dto.setPicture3(multi.getFilesystemName("file3"));
					
		}else {
			//수정 첨부파일이 없으면 (새로운 첨부파일이 없으면)
			//기존의 첨부파일 값을 위에서 무조건 한번 가지고 오도록 되어 있으므로 다시 넣어주는 형태로 수행
			if(sub_filename3 != null) { //기존 첨부파일이 있으면
				dto.setPicture3(sub_filename3);
			}
		}
		
		// 첨부파일을 제외한 파라미터의 값을 받을때는 getParameter
		// 첨부파일의 파라미터 값을 받을때는 getFilesystemName
		
		dto.setHandout_post_num(Integer.parseInt(multi.getParameter("handout_post_num")));
		dto.setTitle(multi.getParameter("title"));
		dto.setArea(multi.getParameter("area"));
		dto.setType_list(multi.getParameter("kinds"));
		dto.setPeriod_list(multi.getParameter("period of use"));
		dto.setCondition_list(multi.getParameter("Product status"));
		dto.setNickname(multi.getParameter("nickname"));
		dto.setContent(multi.getParameter("contents"));
		//dto.setMain_picture(multi.getFilesystemName("mainfile"));
		//dto.setPicture1(multi.getFilesystemName("file1"));
		//dto.setPicture2(multi.getFilesystemName("file2"));
		//dto.setPicture3(multi.getFilesystemName("file3"));
		//dto.setReadcount(Integer.parseInt(multi.getParameter("readcount")));
		
		//dto 값을 업데이트 시켜주어야 한다.
		dao.updateMethod(dto);
	    return multi;
	}// end excute()/////////
}
