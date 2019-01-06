package semidemo.dto;

public class Handout_postDTO {
	private int handout_post_num; //게시물번호(시퀀스)
	private int readcount; //조회수
	private String title; //제목
	private String area; //지역
	private String type_list; //종류
	private String period_list; //사용기간
	private String condition_list; //상태
	private String nickname; //닉네임
	private String content; //내용
	private String main_picture; //메인이미지
	private String picture1; //첨부파일1
	private String picture2; //첨부파일2
	private String picture3; //첨부파일3
	
	public Handout_postDTO() {
		// TODO Auto-generated constructor stub
	}

	
	
	public int getHandout_post_num() {
		return handout_post_num;
	}



	public void setHandout_post_num(int handout_post_num) {
		this.handout_post_num = handout_post_num;
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



	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getType_list() {
		return type_list;
	}

	public void setType_list(String type_list) {
		this.type_list = type_list;
	}

	public String getPeriod_list() {
		return period_list;
	}

	public void setPeriod_list(String period_list) {
		this.period_list = period_list;
	}

	public String getCondition_list() {
		return condition_list;
	}

	public void setCondition_list(String condition_list) {
		this.condition_list = condition_list;
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

	public String getMain_picture() {
		return main_picture;
	}

	public void setMain_picture(String main_picture) {
		this.main_picture = main_picture;
	}

}
