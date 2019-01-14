package semidemo.dto;

import java.util.Date;

public class Momtalk_commDTO {
	private int momtalk_post_num; //게시물번호(시퀀스)
	private int momtalk_comm_num; //댓글번호
	private String content; //내용
	private Date write_time; //작성시간
	private String nickname; //닉네임
	private String grade; //등급
	
	public Momtalk_commDTO() {
		// TODO Auto-generated constructor stub
	}

	

	public int getMomtalk_post_num() {
		return momtalk_post_num;
	}



	public void setMomtalk_post_num(int momtalk_post_num) {
		this.momtalk_post_num = momtalk_post_num;
	}



	public int getMomtalk_comm_num() {
		return momtalk_comm_num;
	}



	public void setMomtalk_comm_num(int momtalk_comm_num) {
		this.momtalk_comm_num = momtalk_comm_num;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Date getWrite_time() {
		return write_time;
	}



	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}



	public String getGrade() {
		return grade;
	}



	public void setGrade(String grade) {
		this.grade = grade;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	
}
