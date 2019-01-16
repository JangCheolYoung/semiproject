package semidemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import semidemo.dto.RecipeDTO;

public class RecipeDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 싱글톤 객체 생성-------------------------------------------------------------------
	public RecipeDAO() {

	}

	private static RecipeDAO dao = new RecipeDAO();

	public static RecipeDAO getInstance() {
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

	public List<RecipeDTO> level_img(String r_lv) {
		List<RecipeDTO> aList = new ArrayList<RecipeDTO>();

		try {
			conn = init();
			String sql = "select * from recipe where growth_level = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, r_lv);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setGrowth_level(rs.getString("growth_level"));
				dto.setRecipe_title(rs.getString("recipe_title"));
				dto.setIngredient(rs.getString("ingredient"));
				dto.setR_order(rs.getString("r_order"));
				dto.setTip(rs.getString("tip"));
				aList.add(dto);
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
		return aList;
	}


	public List<RecipeDTO> search(String data) {
		List<RecipeDTO> list = new ArrayList<RecipeDTO>();

		try {
			conn = init();
			String sql = "select * from recipe where (recipe_title||ingredient||tip) like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + data + "%");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				RecipeDTO dto = new RecipeDTO();
				dto.setGrowth_level(rs.getString("growth_level"));
				dto.setRecipe_title(rs.getString("recipe_title"));
				dto.setIngredient(rs.getString("ingredient"));
				dto.setR_order(rs.getString("r_order"));
				dto.setTip(rs.getString("tip"));
				list.add(dto);
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
		return list;
	}
}// end class
