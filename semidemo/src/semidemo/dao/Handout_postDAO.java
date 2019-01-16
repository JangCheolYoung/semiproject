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
import semidemo.dto.PageDTO;

public class Handout_postDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 싱글톤 객체 생성-------------------------------------------------------------------
	private Handout_postDAO() {

	}

	private static Handout_postDAO dao = new Handout_postDAO();

	public static Handout_postDAO getInstance() {
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

	public void handOut_insertMethod(Handout_postDTO dto) {
		try {
			conn = init();
			
			String sql = "insert into handout_post values(handout_post_num_seq.nextval,?,?,?,?,?,?,?,?,?,?,?,0)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getArea());
			pstmt.setString(3, dto.getType_list());
			pstmt.setString(4, dto.getPeriod_list());
			pstmt.setString(5, dto.getCondition_list());
			pstmt.setString(6, dto.getNickname());
			pstmt.setString(7, dto.getContent());
			pstmt.setString(8, dto.getMain_picture());
			pstmt.setString(9, dto.getPicture1());
			pstmt.setString(10, dto.getPicture2());
			pstmt.setString(11, dto.getPicture3());
			pstmt.executeUpdate();
			conn.commit();

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
	}// end insertMethod()///////////////////////

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

	public List<Handout_postDTO> listMethod(PageDTO pdto) {
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

	// readCount (조회수) 증가시키는 메소드.
	public void readCountMethod(int num) {
		try {
			// Statement의 경우에는 재컴파일을 해줘야 한다.
			// Statement는 쿼리문 문자열 작성하는데에 복잡하다.
			// 가급적이면 prepareStatement를 사용하는게 좋을것 같다.
			// 순차적으로 가져오는 정해진 쿼리문은 Statement를 사용하는게 좋다.
			conn = init();
			String sql = "update handout_post set readcount=readcount+1 where handout_post_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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

	}// end readCountMethod()//////////////////////////////////

	/// viewMetiod 시작
	public Handout_postDTO viewMethod(int num) {
		Handout_postDTO dto = null;

		try {
			conn = init();
			
			String sql = "select * from handout_post where handout_post_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto = new Handout_postDTO();
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
			}

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

		return dto;
	}// end viewMethod()///////////////////////////////////////////
	
	//메인이미지 
	public String fileMethod(int num) {
		String fileName = null;
		
		try {
			conn = init();
			
			String sql = "select main_picture from handout_post where handout_post_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				fileName = rs.getString("main_picture");
				
			}
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
	}//end fileMethod()//////////////
	
	//서브이미지1
	public String fileMethod1(int num) {
		String fileName = null;
		
		try {
			conn = init();
			
			String sql = "select picture1 from handout_post where handout_post_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				fileName = rs.getString("picture1");
				
			}
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
	}//end fileMethod()1//////////////	
	
	//서브이미지2
	public String fileMethod2(int num) {
		String fileName = null;
		
		try {
			conn = init();
			
			String sql = "select picture2 from handout_post where handout_post_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				fileName = rs.getString("picture2");
				
			}
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
	}//end fileMethod()2//////////////	
	
	//서브이미지3
	public String fileMethod3(int num) {
		String fileName = null;
		
		try {
			conn = init();
			
			String sql = "select picture3 from handout_post where handout_post_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				fileName = rs.getString("picture3");
				
			}
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
	}//end fileMethod3()//////////////	
	
	public void updateMethod(Handout_postDTO dto) {
		try {
			conn = init();
			
			String sql = "update handout_post set title=?, area=?, type_list=?, period_list=?, condition_list=?, content=?, main_picture=?, picture1=?, picture2=?, picture3=? where handout_post_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getArea());
			pstmt.setString(3, dto.getType_list());
			pstmt.setString(4, dto.getPeriod_list());
			pstmt.setString(5, dto.getCondition_list());
			pstmt.setString(6, dto.getContent());
			pstmt.setString(7, dto.getMain_picture());
			pstmt.setString(8, dto.getPicture1());
			pstmt.setString(9, dto.getPicture2());
			pstmt.setString(10, dto.getPicture3());
			pstmt.setInt(11, dto.getHandout_post_num());
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
	}
	
	//삭제하기
	public void deleteMethod(int handout_post_num) {
		try {
			conn = init();
			String sql = "delete from handout_post where handout_post_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, handout_post_num);
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
	}
	
	
	  public void comm_allDeleteMethod(int handout_post_num) {
		   try {
			conn = init();
			String sql = "delete from handout_comm where handout_post_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, handout_post_num);
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
	   }//end comm_deleteMethod()//////////////////////
	
	
}// end class
