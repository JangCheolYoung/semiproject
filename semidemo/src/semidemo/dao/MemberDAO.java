package semidemo.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import semidemo.dto.MemberDTO;

public class MemberDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 싱글톤 객체 생성-------------------------------------------------------------------
	private MemberDAO() {

	}

	private static MemberDAO dao = new MemberDAO();

	public static MemberDAO getInstance() {
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

	public MemberDTO getMemberList_From_id(String id){
		MemberDTO dto=null;
				
				
		try {
			conn=init();
			String sql = "select * from member where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto= new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setNickname(rs.getString("nickname"));
				dto.setEmail(rs.getString("email"));
				dto.setGender(rs.getString("gender"));
//				dto.setMem_num(rs.getInt("mem_num"));
//				dto.setPass_answ(rs.getString("pass_answ"));
//				dto.setPass_ques(rs.getString("pass_ques"));
//				dto.setPassword(rs.getString("password"));
				
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
	
	
	
	// 회원가입 시 DB에 정보 삽입
	public void insertMember(MemberDTO dto) {
		try {

			conn = init();

			String sql = "insert into member values(member_num_seq.nextval,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, dto.getNickname());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPassword());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getGender());
			pstmt.setString(6, dto.getPass_ques());
			pstmt.setString(7, dto.getPass_answ());

			pstmt.executeUpdate();
			conn.commit();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				exit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}// end insertMethod()

//로그인 시 DB의 아이디, 패스워드와 같은지 확인 후 같을 경우 로그인 완료 
	public int loginCheck(String id, String password) {
		try {
			conn = init();
			String sql = "SELECT password FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				if (rs.getString(1).equals(password) || rs.getString(1) == password) {
					return 1;// 로그인 성공
				} else {
					return 0;// 비밀번호 불일치
				}
			}
			return -1;// 아이디가 없음

		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {
			try {
				exit();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return -2; // 데이터베이스 오류

	}// end loginCheck()//////////////////////

	// 아이디 중복검사
	public boolean IdDupChk(String id) {
		boolean x = false;

		try {
			conn = init();
			String sql = "SELECT id FROM member WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next())
				x = true;// 해당아이디 존재

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
		return x;
	}

	// 닉네임 중복검사
	public boolean nicknameDupChk(String nickname) {
		boolean x = false;

		try {
			conn = init();
			String sql = "SELECT nickname FROM member WHERE nickname=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nickname);
			rs = pstmt.executeQuery();
			if (rs.next())
				x = true;// 해당닉네임 존재

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
		return x;
	}
	
	// 이메일 중복검사
	public boolean emailDupChk(String email) {
		boolean x = false;

		try {
			conn = init();
			String sql = "SELECT email FROM member WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if (rs.next())
				x = true;// 해당이메일 존재

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
		return x;
	}


	// 아이디 찾기
	public String findId2(String emailAdd) {
		String id = null;

		try {
			conn = init();
			String sql = "SELECT id FROM member WHERE email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, emailAdd);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				id = rs.getString("id");
			}
			System.out.println(id);

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
		return id;
	}

	// 비밀번호 찾기
	public String findPassword(String id, String pass_ques, String pass_answ) {
		String password = null;

		try {
			conn = init();
			String sql = "SELECT password FROM member WHERE id=? AND pass_ques=? AND pass_answ=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass_ques);
			pstmt.setString(3, pass_answ);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				password=rs.getString("password");// 다 맞는 거 입력했을 경우
				
			}else
				password=null;
			
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
		return password;
	}
}// end class
