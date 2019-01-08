package semidemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import semidemo.dto.QnaDTO;

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

	public List<QnaDTO> listMethod(){
		List<QnaDTO> list = new ArrayList<QnaDTO>();

		try {
			conn=init();
			String sql="select * from qna order by qna_num desc";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				QnaDTO dto = new QnaDTO();
				dto.setQna_num(rs.getInt("qna_num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setTitle(rs.getString("title"));
				dto.setWrite_date(rs.getDate("write_date"));
				dto.setReadcount(rs.getInt("readcount"));
				list.add(dto);
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
		
		return list;
	}// end listMethod()///////////////////////////////////////////////

	// 게시물 등록하는 메소드.
	public void insertMethod(QnaDTO dto) {
		try {
			conn = init();

		
				String sql = "insert into qna(qna_num, nickname, title, write_date, readcount, ref, re_step, re_level, content, image)"
						+ " values(board_num_seq.nextval, '영철이', ?, sysdate,0, board_num_seq.nextval, 0, 0, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getContent());
				pstmt.setString(3, dto.getImage());

		
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
	
	//상세 페이지 정보를 가져오는 메소드.
	public QnaDTO qnaViewMethod(int num) {
		QnaDTO dto = null;
		
		try {
			conn=init();
			String sql = "select * from qna where qna_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	} // end qnaViewMethod()//////////////////////////////////
	
	
	
	// 게시물 눌렀을때 조회수 증가시켜주는 메소드.
	public void readCountMethod(int qna_num) {
		try {
			conn=init();
			String sql="update qna set readcount=readcount+1 where qna_num = ?";
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
	}//end readCountMethod()//////////////////////////

}//end class/////////////////////////////////////////
