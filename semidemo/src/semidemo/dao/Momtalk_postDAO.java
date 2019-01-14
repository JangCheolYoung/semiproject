package semidemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import semidemo.dto.Momtalk_commDTO;
import semidemo.dto.Momtalk_postDTO;

public class Momtalk_postDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 싱글톤 객체 생성-------------------------------------------------------------------
	private Momtalk_postDAO() {

	}

	private static Momtalk_postDAO dao = new Momtalk_postDAO();

	public static Momtalk_postDAO getInstance() {
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
	
	//글입력 메소드
	public void insertMethod(Momtalk_postDTO dto) {
		try {
			conn = init();
			String sql = "insert into momtalk_post(momtalk_post_num, nickname, write_time, content, grade, picture1, picture2, picture3, like_cnt, gender) " 
					+ "values(momtalk_post_num_seq.nextval, ?, sysdate, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			/*pstmt.setString(1, dto.getNickname());*/
			pstmt.setString(1, "영철이");
			pstmt.setString(2, dto.getContent());
			/*pstmt.setString(3, dto.getGrade());*/
			pstmt.setString(3, "새싹");
			pstmt.setString(4, dto.getPicture1());
			pstmt.setString(5, dto.getPicture2());
			pstmt.setString(6, dto.getPicture3());
			/*pstmt.setInt(7, dto.getLike_cnt());*/
			pstmt.setInt(7, 0);
			pstmt.setString(8, "woman");
			
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
	}//end insertMethod()
	
	
	// ------------------------------------------------------------------------------
	
	//전체글 검색하여 가지고 오는 메소드
	public List<Momtalk_postDTO> searchAll(){
		List<Momtalk_postDTO> aList = new ArrayList<Momtalk_postDTO>();
		Momtalk_postDTO dto = null;
		
		try {
			conn = init();
			String sql = "select * from momtalk_post order by momtalk_post_num desc";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				dto = new Momtalk_postDTO();
				
				dto.setMomtalk_post_num(rs.getInt("momtalk_post_num"));
				dto.setNickname(rs.getString("nickname"));
				dto.setContent(rs.getString("content"));
				dto.setGrade(rs.getString("grade"));
				dto.setWrite_time(rs.getDate("write_time"));
				dto.setPicture1(rs.getString("picture1"));
				dto.setPicture2(rs.getString("picture2"));
				dto.setPicture3(rs.getString("picture3"));
				dto.setLike_cnt(rs.getInt("like_cnt"));
				dto.setGender(rs.getString("gender"));
				
				aList.add(dto);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return aList;
	}//end searchAll()
	
	
	// ------------------------------------------------------------------------------
	
	//게시글 삭제 메소드
	public void deleteMethod(int delNum) {
		try {
			conn = init();
			String sql = "delete from momtalk_post where momtalk_post_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, delNum);
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
		
	}//end deleteMethod()
	
	// ------------------------------------------------------------------------------
	
	//게시글에 해당하는 댓글 리스트 가지고 오기
	public List<Momtalk_commDTO> commListMethod(int momtalk_post_num){
		List<Momtalk_commDTO> aList = new ArrayList<Momtalk_commDTO>();
		
		try {
			conn = init();
			String sql = "select * from momtalk_comm where momtalk_post_num = ? order by momtalk_comm_num asc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, momtalk_post_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Momtalk_commDTO dto = new Momtalk_commDTO();
				dto.setNickname(rs.getString("nickname"));
				dto.setWrite_time(rs.getDate("write_time"));
				dto.setContent(rs.getString("content"));
				dto.setMomtalk_comm_num(rs.getInt("momtalk_comm_num"));
				
				aList.add(dto);
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return aList;
	}//end commListMethod()
	
	// ------------------------------------------------------------------------------
	
	//게시글에 해당하는 댓글 추가하기
	public void commInputMethod(Momtalk_commDTO dto) {
		try {
			conn = init();
			String sql = "insert into momtalk_comm values(?,momtalk_comm_num_seq.nextval, ?, sysdate,?, '새싹2')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getMomtalk_post_num());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getNickname());
			
			pstmt.executeUpdate();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}//end commInputMethod()
	
	// ------------------------------------------------------------------------------
	
	//게시글에 해당하는 댓글 삭제하기
	public void commDeleteMethod(int momtalk_comm_num) {
		try {
			conn = init();
			String sql = "delete from momtalk_comm where momtalk_comm_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, momtalk_comm_num);
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
		
		
	}//end commDeleteMethod()
	
	// ------------------------------------------------------------------------------
	
	//게시글에 해당하는 댓글 수정하기
	public void commModiMethod(String content, int momtalk_comm_num) {
		try {
			conn = init();
			String sql = "update momtalk_comm set content = ? where momtalk_comm_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, momtalk_comm_num);
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
	}//end commModiMethod()
	
	// ------------------------------------------------------------------------------
	
	//게시글에 해당하는 댓글 삭제하기
	public void commAllDeleteMethod(int momtalk_post_num) {
		try {
			conn = init();
			String sql = "delete from momtalk_comm where momtalk_post_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, momtalk_post_num);
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
			
		}//end commDeleteMethod()
	
}//end class
