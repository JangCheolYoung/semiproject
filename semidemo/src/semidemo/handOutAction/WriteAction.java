package semidemo.handOutAction;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semidemo.dao.Handout_postDAO;
import semidemo.dto.Handout_postDTO;

public class WriteAction {
	
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
		// 첨부파일을 제외한 파라미터의 값을 받을때는 getParameter
		// 첨부파일의 파라미터 값을 받을때는 getFilesystemName

		dto.setTitle(multi.getParameter("title"));
		dto.setArea(multi.getParameter("area"));
		dto.setType_list(multi.getParameter("kinds"));
		dto.setPeriod_list(multi.getParameter("period of use"));
		dto.setCondition_list(multi.getParameter("Product status"));
		//dto.setNickname(multi.getParameter("nickname"));
		dto.setContent(multi.getParameter("contents"));
		dto.setMain_picture(multi.getFilesystemName("mainfile"));
		dto.setPicture1(multi.getFilesystemName("file1"));
		dto.setPicture2(multi.getFilesystemName("file2"));
		dto.setPicture3(multi.getFilesystemName("file3"));
		//dto.setReadcount(Integer.parseInt(multi.getParameter("readcount")));
		
		dao.handOut_insertMethod(dto);
	    return multi;
	}// end excute()/////////
}// end class
