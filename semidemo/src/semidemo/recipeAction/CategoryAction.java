package semidemo.recipeAction;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dto.RecipeDTO;
import semidemo.dao.RecipeDAO;

	@WebServlet("/mammaMain/recipe.do")
	public class CategoryAction extends HttpServlet{
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String r_lv = req.getParameter("r_lv");
			RecipeDAO dao = RecipeDAO.getInstance();
			List<RecipeDTO> aList=dao.level_img(r_lv);
			req.setAttribute("aList", aList);
			if (r_lv == null) {
				RequestDispatcher dis = req.getRequestDispatcher("/semiview/menu/RecipePage.jsp");
				dis.forward(req, resp);
			} else {
				RequestDispatcher dis = req.getRequestDispatcher("/semiview/menu/recipe2.jsp");
				dis.forward(req, resp);
			}
			
		}
	}//end class