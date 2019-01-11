package semidemo.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;	

import com.oreilly.servlet.MultipartRequest;

import semidemo.loginAction.IdDupChkAction;
import semidemo.loginAction.LoginAction;
import semidemo.loginAction.LogoutAction;
import semidemo.loginAction.SignAction;
import semidemo.qnaAction.QnADeleteAction;
import semidemo.qnaAction.QnAListAction;
import semidemo.qnaAction.QnAUpdateAction;
import semidemo.qnaAction.QnAUpdateFormAction;
import semidemo.qnaAction.QnAViewAction;
import semidemo.qnaAction.QnAWriteAction;

//시작하는 곳 (메인 페이지)
@WebServlet("/mammaMain/*")
public class semiMainController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
		
	}//end doGet()//////////////////////////////////////////
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}//end doPost()/////////////////////////////////////////
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//한글깨짐안되도록 설정
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		//uri 가져오기
		String uri = req.getRequestURI();
		
		//uri에서 필요한 부분만 가지고 오기
		String action = uri.substring(uri.lastIndexOf("/"));
		
		
		
		//forward 경로지정할 변수
		String path = "";
		
		if(action.equals("/*") || action.equals("/main.do")) {
			//메인 페이지로 이동 (페이지지정 및 이동)
			path = "/semiview/main/semimain.jsp";
			
		} else if(action.equals("/login.do")) {
			// 로그인 페이지로 이동
			path = "/semiview/login/login.jsp";
			
		}
		else if(action.equals("/logout.do")) {
			// 로그아웃 누르면 메인 페이지로 이동
			LogoutAction logout = new LogoutAction();
			logout.execute(req, resp);
			
			resp.sendRedirect("main.do");
		}else if (action.equals("/loginPro.do")) {
			
			LoginAction login = new LoginAction();
			login.execute(req, resp);
			
		} else if (action.equals("/signup.do")) {
			// 회원가입 페이지로 이동
			
			path = "/semiview/login/signup.jsp";
			
		} else if (action.equals("/signUpWrite.do")) {
			// 파라미터 값을 넘겨주는 과정

			SignAction join = new SignAction();
			join.execute(req, resp);

			resp.sendRedirect("login.do");

		}else if (action.equals("/idDuplication.do")) {
			// 아이디 중복 파라미터 값을 넘겨주는 과정
			System.out.println("중복검사액션점두");
			IdDupChkAction idDup = new IdDupChkAction();
			idDup.execute(req, resp);
				
		} else if (action.equals("/find.do")) {
			// 아이디,비번찾기 페이지로 이동
			path = "/semiview/login/find.jsp";

		} else if(action.equals("/recipe.do")) {
			//레시피 페이지로 이동
			path = "/semiview/menu/recipe/RecipePage.jsp";
			
		}else if(action.equals("/momTalk.do")) {
			//맘톡 페이지로 이동
			path = "/semiview/menu/momTalk/momTalkPage.jsp";
			
		}else if(action.equals("/handOut.do")) {
			//무료나눔 페이지로 이동
			path = "/semiview/menu/handOut/handOutPage.jsp";
			
		}else if(action.equals("/info.do")) {
			//육아정보 페이지로 이동
			path = "/semiview/menu/information/informationPage.jsp";
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			
		}else if(action.equals("/question.do")) {
			//Q&A 페이지로 이동
			QnAListAction qnaList = new QnAListAction();
			qnaList.execute(req, resp);
			path = "/semiview/menu/QnA/questionPage.jsp";
			
		}else if(action.equals("/qnaView.do")) {
			QnAViewAction qnaView = new QnAViewAction();
			qnaView.execute(req, resp);
			
			path = "/semiview/menu/QnA/qnaView.jsp";
				
		}else if(action.equals("/qnaWriteForm.do")) {
			path = "/semiview/menu/QnA/qnaWrite.jsp";
			
		}else if(action.equals("/qnaWrite.do")) {
			QnAWriteAction qnaWrite = new QnAWriteAction();
			MultipartRequest multi = qnaWrite.execute(req, resp);
			resp.sendRedirect("question.do?pageNum="+multi.getParameter("pageNum"));
			
		}else if(action.equals("/qnaUpdateForm.do")) {
			QnAUpdateFormAction qnaUpdateForm = new QnAUpdateFormAction();
			 qnaUpdateForm.execute(req, resp);
			path = "/semiview/menu/QnA/qnaUpdate.jsp";
			
		}else if(action.equals("/qnaUpdate.do")) {
			QnAUpdateAction qnaUpdate = new QnAUpdateAction();
			MultipartRequest multi=qnaUpdate.execute(req, resp);
			
			resp.sendRedirect("question.do?pageNum="+multi.getParameter("pageNum"));
		}else if(action.equals("/qnaDelete.do")) {
			QnADeleteAction qnaDelete = new QnADeleteAction();
			qnaDelete.execute(req, resp);
			resp.sendRedirect("question.do");
		}
		
		
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		if(path!="") { //기본값이 아닐때, path가 설정되어 있을때, sendRedirect방식을 사용할때, forward방식을 사용하지 않을때
			RequestDispatcher dis = req.getRequestDispatcher(path);
			dis.forward(req, resp);
		}
		
	}//end doProcess()//////////////////////////////////////
}//end class
