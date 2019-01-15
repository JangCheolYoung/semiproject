package semidemo.recipeAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.RecipeDAO;
import semidemo.dto.RecipeDTO;

public class RecipeListAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String r_lv = req.getParameter("r_lv");
		RecipeDAO dao = RecipeDAO.getInstance();
		List<RecipeDTO> aList = dao.level_img(r_lv);
		req.setAttribute("aList", aList);

	}
}
