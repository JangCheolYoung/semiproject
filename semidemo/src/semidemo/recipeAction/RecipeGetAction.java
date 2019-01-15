package semidemo.recipeAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.RecipeDAO;
import semidemo.dto.RecipeDTO;

public class RecipeGetAction {
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String data = req.getParameter("data");

		RecipeDAO dao = RecipeDAO.getInstance();
		List<RecipeDTO> aList = dao.search(data);
		req.setAttribute("aList", aList);
	}
}
