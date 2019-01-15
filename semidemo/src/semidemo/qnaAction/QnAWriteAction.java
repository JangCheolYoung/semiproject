package semidemo.qnaAction;

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
		
		dto.setNickname(multi.getParameter("nickname"));
		dto.setTitle(multi.getParameter("qna_title"));// multi에서 parameter값을 가져옴.
		dto.setContent(multi.getParameter("qna_content"));
		dto.setImage(multi.getFilesystemName("image")); // 첨부파일을 가져올때는 getFilesystemName()을 사용.
		dto.setQna_category(multi.getParameter("qna_category"));

//		if(multi.getParameter("re_step").equals("0")) {
//			dto.setTitle("[답변]"+multi.getParameter("qna_title"));
//		}
		
		if(multi.getParameter("re_level") != null) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			//파라미터값에서 넘어오는 값을 그대로 넘김
			map.put("ref", Integer.parseInt(multi.getParameter("ref")));
			map.put("re_step", Integer.parseInt(multi.getParameter("re_step")));
			//re_step값 1증가하는 처리를 함 ->FILO을 위한 과정
			dao.reStepMethod(map); 
			
			//답변글의 경우 ref는 그대로 / re_step, re_level는 +1해서 처리
			dto.setRef(Integer.parseInt(multi.getParameter("ref")));
			dto.setRe_step(Integer.parseInt(multi.getParameter("re_step"))+1);
			dto.setRe_level(Integer.parseInt(multi.getParameter("re_level"))+1);
			
			System.out.println(dto.getRe_step());
			System.out.println(dto.getRe_level());
		}
		

		dao.insertMethod(dto);
		return multi;
	}// end execute()/////////////////////////////////////////////////

}// end class

