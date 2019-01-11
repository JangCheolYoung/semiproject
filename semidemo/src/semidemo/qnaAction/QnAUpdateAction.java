package semidemo.qnaAction;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semidemo.dao.QnaDAO;
import semidemo.dto.QnaDTO;

public class QnAUpdateAction {
	public MultipartRequest execute(HttpServletRequest req, HttpServletResponse resp) {

		MultipartRequest multi = null;
		
		/*String path = req.getServletContext().getRealPath("/");
		System.out.println("path:"+path);
		String saveDirectory = path+"/temp";*/
		
		String saveDirectory = "C:\\study\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\semidemo\\semiview\\images\\qna";
		File file = new File(saveDirectory);

		// 파일이 없으면 생성해야 하므로. file.exists()에 not(=!)을 붙인다.
		if (!file.exists())
			file.mkdir(); // 생성할 패키지가 하나면 mkdir(); 여러개면 mkdirs();
		int maxPostSize = 1 * 1000 * 1000 * 1000; // 1GB
		String encoding = "UTF-8"; // 인코딩
		try {
			multi = new MultipartRequest(req, saveDirectory, maxPostSize, encoding, new DefaultFileRenamePolicy());
			// new DefaultFileRenamePolicy() : 파일의 중복명을 제거하기 위해 사용되는 객체

		} catch (IOException e) {
			e.printStackTrace();
		}

		QnaDAO dao = QnaDAO.getInstance();
		QnaDTO dto = new QnaDTO();
		int num = Integer.parseInt(multi.getParameter("qna_num"));
		
		//num에 해당되는 첨부파일을 가지고옴
				//첨부파일이 있는지 없는지 판단함
				//board테이블에 첨부파일의 저장 여부 검색
				String filename = dao.fileMethod(num);
				
				//기존에 첨부파일이 있는경우 : 새로 선택하면 -> 기존에 있는 것을 서버에서 삭제하고 새로 선택한것을 넣어줌 / 새로 선택안하면 -> 기존것 그대로 사용
				//기존에 첨부파일이 없는 경우 : 새로 선택하면 -> 새로 선택한 것을 넣어줌 / 새로 선택안하면 -> 계속 안한상태
				
				//수정 첨부파일이 있으면 (새로운 첨부파일이 있으면)
				if(multi.getFilesystemName("image") != null) {
					//서버에 있는 기존 첨부파일을 삭제해 주어야 한다.
					//기존 첨부파일이 있으면
					if(filename != null) {
						//board 테이블의 첨부파일을 삭제
						File oldFile = new File(saveDirectory, filename);
						oldFile.delete(); //saveDirectory에 있는 filename의 첨부파일이 삭제가 됨
					}
					
					//기존의 첨부파일이 없는 경우에도 새로운 첨부파일을 넣어주어야함
					//새로운 첨부파일을 넣어줌
					dto.setImage(multi.getFilesystemName("image"));
					
				}else {
					//수정 첨부파일이 없으면 (새로운 첨부파일이 없으면)
					//기존의 첨부파일 값을 위에서 무조건 한번 가지고 오도록 되어 있으므로 다시 넣어주는 형태로 수행
					if(filename != null) { //기존 첨부파일이 있으면
						dto.setImage(filename);
					}
				}
		
		dto.setTitle(multi.getParameter("qna_title"));// multi에서 parameter값을 가져옴.
		dto.setContent(multi.getParameter("qna_content"));
		//dto.setImage(multi.getFilesystemName("image")); // 첨부파일을 가져올때는 getFilesystemName()을 사용.

		dto.setQna_num(Integer.parseInt(multi.getParameter("qna_num")));

		dao.qnaUpdateMethod(dto);
		return multi;
	}// end execute()/////////////////////////////////////////////////
}
