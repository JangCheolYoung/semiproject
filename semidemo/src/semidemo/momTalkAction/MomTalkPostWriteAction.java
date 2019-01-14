package semidemo.momTalkAction;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semidemo.dao.MemberDAO;
import semidemo.dao.Momtalk_postDAO;
import semidemo.dto.Momtalk_postDTO;

@WebServlet("/MomTalkPostWriteAction")
public class MomTalkPostWriteAction{
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("actionIN");
		
		//첨부파일 처리를 위해
		MultipartRequest multi = null;
		
		//저장경로 지정 (이런식으로 가져온 경로에 파일을 만들어서 저장해야 하나의 서버에서 동일하게 접근하여 사용할 수 있다.)
		//String path = req.getServletContext().getRealPath("/"); //전체 경로를 가지고 옴
		//String saveDirectory = path + "/temp"; //저장장소 지정
		//System.out.println(saveDirectory);
		
		String saveDirectory = "c:\\temp";
		
		System.out.println(saveDirectory);
		
		File file = new File(saveDirectory);
		if(!file.exists()) //파일이 존재하지 않으면
			file.mkdir(); //파일 생성
		
		//최대크기지정
		int maxPostSize = 1000000000;
		
		//한글인코딩
		String encoding = "UTF-8";
		
		try {
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		//글입력처리-------------------------------------------------------------------
		Momtalk_postDAO dao = Momtalk_postDAO.getInstance();
		Momtalk_postDTO dto = new Momtalk_postDTO();
		
		//Date now = new Date();
		//SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss a"); //-> 나타낼때
		
		//파라미터값을 받음
		//dto.setNickname(multi.getParameter("")); //닉네임
		//dto.setGrade(grade); //회원등급
		dto.setContent(multi.getParameter("tf")); //입력한 내용
		dto.setPicture1(multi.getFilesystemName("file1")); //첨부파일1
		dto.setPicture2(multi.getFilesystemName("file2")); //첨부파일2
		dto.setPicture3(multi.getFilesystemName("file3")); //첨부파일3
		//dto.setWrite_time(new Date()); //현재날짜,시간 -> 글입력시간
		//dto.setLike_cnt(0); //좋아요
		
		
		
		//dto.setGender(); //성별
		
		dao.insertMethod(dto);
		
	}//end execute()

}//end class
