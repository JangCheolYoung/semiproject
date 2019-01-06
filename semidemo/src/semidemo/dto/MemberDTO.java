package semidemo.dto;

//회원정보
public class MemberDTO {
	private int mem_num; //회원번호
	private String nickname; //닉네임(기본키)
	private String id; //아이디
	private String password; //비밀번호
	private String email; //이메일
	private String gender; //성별
	private String pass_ques; //비밀번호찾기질문
	private String pass_answ; //비밀번호찾기대답
	private String grade; //등급
	private int cnt; //맘톡 게시물 수 카운트

	public MemberDTO() {
		
	}

	

	public int getMem_num() {
		return mem_num;
	}



	public void setMem_num(int mem_num) {
		this.mem_num = mem_num;
	}



	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPass_ques() {
		return pass_ques;
	}

	public void setPass_ques(String pass_ques) {
		this.pass_ques = pass_ques;
	}

	public String getPass_answ() {
		return pass_answ;
	}

	public void setPass_answ(String pass_answ) {
		this.pass_answ = pass_answ;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	
}
