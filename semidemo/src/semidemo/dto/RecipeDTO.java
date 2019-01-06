package semidemo.dto;

public class RecipeDTO {
	private String growth_level; //개월수
	private String recipe_title; //레시피제목
	private String main_picture; //메인사진
	private String content; //내용 
	
	public RecipeDTO() {
		// TODO Auto-generated constructor stub
	}

	public String getGrowth_level() {
		return growth_level;
	}

	public void setGrowth_level(String growth_level) {
		this.growth_level = growth_level;
	}

	public String getRecipe_title() {
		return recipe_title;
	}

	public void setRecipe_title(String recipe_title) {
		this.recipe_title = recipe_title;
	}

	public String getMain_picture() {
		return main_picture;
	}

	public void setMain_picture(String main_picture) {
		this.main_picture = main_picture;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

		
}//end class
