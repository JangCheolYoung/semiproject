package semidemo.recipeAction;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semidemo.dao.RecipeDAO;
import semidemo.dto.RecipeDTO;

@WebServlet("/mammaMain/recipeSearch.do")
public class recipeSearchController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String data=req.getParameter("data");
		
		System.out.println(data);
		RecipeDAO dao=RecipeDAO.getInstance();
		List<RecipeDTO> list=dao.search(data);
		req.setAttribute("list", list);
		RequestDispatcher dis = req.getRequestDispatcher("/semiview/menu/recipe1.jsp");
		dis.forward(req, resp);
		
		
	}
	
}
