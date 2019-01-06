package semidemo.dto;

import java.util.Date;

public class Handout_commDTO {
	private String nickname; // 닉네임
	private String content; // 내용
	private Date write_time; // 작성시간
	private int handout_post_num; // 게시물번호
	private int handout_comm_num; // 댓글번호(시퀀스)
	private String image; // 연락주세요, 질문있어요 이미지 주소

	public Handout_commDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

	public int getHandout_post_num() {
		return handout_post_num;
	}

	public void setHandout_post_num(int handout_post_num) {
		this.handout_post_num = handout_post_num;
	}

	public int getHandout_comm_num() {
		return handout_comm_num;
	}

	public void setHandout_comm_num(int handout_comm_num) {
		this.handout_comm_num = handout_comm_num;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

}