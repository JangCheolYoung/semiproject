package semidemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import semidemo.dto.Handout_commDTO;

public class Handout_commDAO {
   private Connection conn;
   private Statement stmt;
   private PreparedStatement pstmt;
   private ResultSet rs;

   // 싱글톤 객체 생성-------------------------------------------------------------------
   private Handout_commDAO() {

   }

   private static Handout_commDAO dao = new Handout_commDAO();

   public static Handout_commDAO getInstance() {
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
   
   public List<Handout_commDTO> comm_viewMethod(int num){
	   List<Handout_commDTO> comm_list = new ArrayList<Handout_commDTO>();
	   Handout_commDTO dto = null;
	   try {
		conn = init();
		String sql = "select * from handout_comm where handout_post_num=? order by handout_comm_num";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			dto = new Handout_commDTO();
			//dto.setHandout_post_num(rs.getInt("handout_post_num"));
			dto.setHandout_comm_num(rs.getInt("handout_comm_num"));
			dto.setNickname(rs.getString("nickname"));
			dto.setWrite_time(rs.getDate("write_time"));
			dto.setContent(rs.getString("content"));
			dto.setImage(rs.getString("image"));
			comm_list.add(dto);
			
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
	   return comm_list;
   }//end comm_viewMethod()/////////////////
   
   
   public void comm_insertMethod(Handout_commDTO dto) {
	   try {
		conn = init();
		String sql = "insert into handout_comm values(handout_comm_num_seq.nextval, ?, ?, sysdate, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, dto.getHandout_post_num());
		pstmt.setString(2, dto.getNickname());
		pstmt.setString(3, dto.getContent());
		pstmt.setString(4, dto.getImage());
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
   }//end comm_insertMethod()//////////////////////////////////
   
   public void comm_deleteMethod(int handout_comm_num) {
	   try {
		conn = init();
		String sql = "delete from handout_comm where handout_comm_num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, handout_comm_num);
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
   }//end comm_deleteMethod()//////////////////////
   
   public void comm_UpdateMethod(int handout_comm_num, String comm_content) {
	   try {
		conn = init();
		System.out.println("comm_UpdateMethod DB 연결 성공");
		System.out.println(comm_content);
		String sql = "update handout_comm set content=? where handout_comm_num=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, comm_content);
		pstmt.setInt(2, handout_comm_num);
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
}//end class