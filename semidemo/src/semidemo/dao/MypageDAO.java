package semidemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import semidemo.dto.Handout_postDTO;
import semidemo.dto.Mypage_PageDTO;
import semidemo.dto.QnaDTO;
import semidemo.dto.QnaPageDTO;


public class MypageDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 싱글톤 객체 생성-------------------------------------------------------------------
	private MypageDAO() {

	}

	private static MypageDAO dao = new MypageDAO();

	public static MypageDAO getInstance() {
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
//	------------------------------------------------
	
	public List<Handout_postDTO> listMethod(Mypage_PageDTO pdto) {
		List<Handout_postDTO> aList = new ArrayList<Handout_postDTO>();
		try {
			conn = init();
			String sql = "select b.* from (select rownum rm, a.* from (select * from handout_post order by handout_post_num desc)a)b where rm>=? and rm<=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdto.getStartRow());
			pstmt.setInt(2, pdto.getEndRow());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				
				Handout_postDTO dto = new Handout_postDTO();
				dto.setHandout_post_num(rs.getInt("handout_post_num"));
				dto.setTitle(rs.getString("title"));
				dto.setArea(rs.getString("area"));
				dto.setType_list(rs.getString("type_list"));
				dto.setPeriod_list(rs.getString("period_list"));
				dto.setCondition_list(rs.getString("condition_list"));
				dto.setNickname(rs.getString("nickname"));
				dto.setContent(rs.getString("content"));
				dto.setMain_picture(rs.getString("main_picture"));
				dto.setPicture1(rs.getString("picture1"));
				dto.setPicture2(rs.getString("picture2"));
				dto.setPicture3(rs.getString("picture3"));
				dto.setReadcount(rs.getInt("readcount"));
				aList.add(dto);
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
		return aList;
	}// end listMethod()//////////////
	
	public int rowTotalCount() {
		int cnt = 0;
		try {
			conn = init();
			String sql = "select count(*) from handout_post";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
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
		return cnt;
	}// end rowTotalCount()//////////
	
	public int qrowTotalCount() {
		int cnt = 0;
		try {
			conn = init();
			String sql = "select count(*) from qna";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
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
		return cnt;
	}// end rowTotalCount()//////////
	
	public List<QnaDTO> qlistMethod(Mypage_PageDTO pdto) {
		List<QnaDTO> list = new ArrayList<QnaDTO>();

		try {
			conn = init();
			String sql = "select b.* " + "from (select rownum rm, a.* " + "from (select * " + "from qna "
					+ "order by ref desc, qna_num)a)b " + "where rm>=? and rm<=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pdto.getStartRow()); // 시작레코드값
			pstmt.setInt(2, pdto.getEndRow()); // 끝레코드값
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
				dto.setQna_category(rs.getString("qna_category"));
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
	}// end qlistMethod()///////////////////////////////////////////////

	
	
	
}
