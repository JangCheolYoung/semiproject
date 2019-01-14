package semidemo.dto;

import java.util.Date;

public class Momtalk_postDTO {
	private int momtalk_post_num; //게시물번호(시퀀스)
	private String nickname; //닉네임
	private Date write_time; //작성시간
	private String content; //내용
	private String grade; //등급
	private String picture1; //첨부파일1
	private String picture2; //첨부파일2
	private String picture3; //첨부파일3
	private int like_cnt; //좋아요
	private String gender; //성별
	
	public Momtalk_postDTO() {
		// TODO Auto-generated constructor stub
	}

	

	public int getMomtalk_post_num() {
		return momtalk_post_num;
	}



	public void setMomtalk_post_num(int momtalk_post_num) {
		this.momtalk_post_num = momtalk_post_num;
	}



	public String getPicture1() {
		return picture1;
	}



	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}



	public String getPicture2() {
		return picture2;
	}



	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}



	public String getPicture3() {
		return picture3;
	}



	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}



	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getWrite_time() {
		return write_time;
	}

	public void setWrite_time(Date write_time) {
		this.write_time = write_time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}



	public int getLike_cnt() {
		return like_cnt;
	}



	public void setLike_cnt(int like_cnt) {
		this.like_cnt = like_cnt;
	}



	public String getGender() {
		return gender;
	}



	public void setGender(String gender) {
		this.gender = gender;
	}
	
	

}
