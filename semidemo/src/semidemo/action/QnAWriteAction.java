package semidemo.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import semidemo.dao.QnaDAO;
import semidemo.dto.QnaDTO;

public class QnAWriteAction {
	public MultipartRequest execute(HttpServletRequest req, HttpServletResponse resp) {

		MultipartRequest multi = null;
		
		/*String path = req.getServletContext().getRealPath("/");
		System.out.println("path:"+path);
		String saveDirectory = path+"/temp";*/
		
		String saveDirectory = "C:\\study\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\semidemo\\semiview\\images\\qna";
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
		
		dto.setTitle(multi.getParameter("qna_title"));// multi에서 parameter값을 가져옴.
		dto.setContent(multi.getParameter("qna_content"));
		dto.setImage(multi.getFilesystemName("image")); // 첨부파일을 가져올때는 getFilesystemName()을 사용.

	

		dao.insertMethod(dto);
		return multi;
	}// end execute()/////////////////////////////////////////////////

}// end class

