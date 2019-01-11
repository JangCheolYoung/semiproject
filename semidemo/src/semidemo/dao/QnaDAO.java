package semidemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import semidemo.dto.QnaDTO;
import semidemo.dto.QnaPageDTO;

public class QnaDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 싱글톤 객체 생성-------------------------------------------------------------------
	private QnaDAO() {

	}

	private static QnaDAO dao = new QnaDAO();

	public static QnaDAO getInstance() {
		return dao;
	}
	// 반복되서 사용되는 것----------------------------------------------------------------

	// 1.Connection 객체값 받아오기 (DriverManager에 있는 getConnection를 이용)
	private Connection init() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		String url = "jdbc:oracle:thin://@127.0.0.1:1521:xe";
		String user = "hr";
		String password = "a1234";
		return DriverManager.getConnection(url, user, password);
	}// end init()

	// 2.연결종료
	private void exit() throws SQLException {
		if (rs != null)
			rs.close();
		if (stmt != null)
			stmt.close();
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}// end exit()

	// ------------------------------------------------------------------------------

	public List<QnaDTO> listMethod(QnaPageDTO pdto) {
		List<QnaDTO> list = new ArrayList<QnaDTO>();

		try {
			conn = init();
			String sql = "select b.* "
					+"from (select rownum rm, a.* "
					+"from (select * "
					+"from qna "
					+"order by ref desc, qna_num)a)b "
					+"where rm>=? and rm<=?";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdto.getStartRow()); //시작레코드값
			pstmt.setInt(2, pdto.getEndRow()); //끝레코드값
			rs = pstmt.executeQuery();
			while (rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setQna_num(rs.getInt("qna_num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setWrite_date(rs.getDate("write_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				list.add(dto);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}// end listMethod()///////////////////////////////////////////////

	// 게시물 등록하는 메소드.
	public void insertMethod(QnaDTO dto) {
		try {
			conn = init();

			if(dto.getRe_level() > 0) {
				String sql = "insert into qna(qna_num, nickname, title, write_date, readcount, ref, re_step, re_level, content, image)"
						+ " values(board_num_seq.nextval, '영철이', ?, sysdate,0, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getTitle());
				pstmt.setInt(2, dto.getRef());
				pstmt.setInt(3, dto.getRe_step());
				pstmt.setInt(4, dto.getRe_level());
				pstmt.setString(5, dto.getContent());
				pstmt.setString(6, dto.getImage());
				
			}
			else {
				String sql = "insert into qna(qna_num, nickname, title, write_date, readcount, ref, re_step, re_level, content, image)"
						+ " values(board_num_seq.nextval, '영철이', ?, sysdate,0, board_num_seq.nextval, 0, 0, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getContent());
				pstmt.setString(3, dto.getImage());
			}
			// executeUpdate()는 마지막에 해주는 작업으로 밑으로 뺀다.
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}// end insertMethod()//////////////////////////////////////

	// 상세 페이지 정보를 가져오는 메소드.
	public QnaDTO qnaViewMethod(int qna_num) {
		QnaDTO dto = null;

		try {
			conn = init();
			String sql = "select * from qna where qna_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new QnaDTO();
				dto.setQna_num(rs.getInt("qna_num"));
				//System.out.println("qnaViewMethod "+ dto.getQna_num());
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setWrite_date(rs.getDate("write_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return dto;
	} // end qnaViewMethod()//////////////////////////////////

	// 게시물 눌렀을때 조회수 증가시켜주는 메소드.
	public void readCountMethod(int qna_num) {
		try {
			conn = init();
			String sql = "update qna set readcount=readcount+1 where qna_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}// end readCountMethod()//////////////////////////

	// 총 레코드수 반환을 위한 작업
	public int qnaRowTotalCount() {
		int cnt = 0;

		try {
			conn = init();
			String sql = "select count(*) from qna";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				cnt = rs.getInt(1); // count(*)

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return cnt;
	}// end rowTotalCount()

	
	// update.jsp에 보내줄 데이터를 dto로 반환해주는 메소드. 
	/*public QnaDTO sendDtoMethod(int qna_num) {
		QnaDTO dto = null;
		
		
		try {
			conn=init();
			String sql = "select * from qna where qna_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, qna_num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new QnaDTO();
				dto.setQna_num(rs.getInt("qna_num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setWrite_date(rs.getDate("write_date"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setRef(rs.getInt("ref"));
				dto.setRe_step(rs.getInt("re_step"));
				dto.setRe_level(rs.getInt("re_level"));
				dto.setContent(rs.getString("content"));
				dto.setImage(rs.getString("image"));
				
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return dto;
	}
	*/
	
	public void qnaUpdateMethod(QnaDTO dto) {
		
		try {
			conn=init();
			String sql = "update qna set title=?, content=?, image=? where qna_num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getImage());
			pstmt.setInt(4, dto.getQna_num());
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}// end qnaUpdateMethod()//////////////////////////
	
	//다운로드 파일명 리턴
		public String fileMethod(int qna_num) {
			String fileName = null;
			
			try {
				conn = init();
				String sql = "select image from qna where qna_num = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, qna_num);
				rs = pstmt.executeQuery();
				
				if(rs.next())
					fileName = rs.getString("image");
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					exit();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			return fileName;
		}//end fileMethod()
		
		// qna레코드 삭제해주는 메소드.
		public void qnaDeleteMethod(int qna_num) {
			try {
				conn=init();
				String sql = "delete qna where ref=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, qna_num);
				pstmt.executeUpdate();
			} catch (ClassNotFoundException e) { 
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					exit();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
		}//end qnaDeleteMethod()//////////////////////////////////
		
		// 답변글 작성시 re_step값 증가를 위한 함수
		// FILO 구조를 위해서 사용  (후입선출, 가장 나중에 들어온 값(최근값)이 가장 먼저 출력되는 형태)
		public void reStepMethod(HashMap<String, Integer> map) {		
			try {
				conn = init();
				System.out.println("reStepMethod 메소드!!");
				String sql = "update qna set re_step = re_step+1 where ref = ? and re_step>?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, map.get("ref"));
				pstmt.setInt(2, map.get("re_step"));
				pstmt.executeUpdate();
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					exit();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}//end reStepMethod()
		
		
		
	
}// end class/////////////////////////////////////////
