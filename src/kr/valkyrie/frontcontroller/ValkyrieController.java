package kr.valkyrie.frontcontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import kr.valkyrie.ajaxcontroller.AjaxController;
import kr.valkyrie.ajaxcontroller.DSTimeStatisticsController;
import kr.valkyrie.ajaxcontroller.MSTimeStatisticsAjaxController;
import kr.valkyrie.ajaxcontroller.MSTimeStatisticsController;
import kr.valkyrie.ajaxcontroller.Ranking_dayAjaxController;
import kr.valkyrie.ajaxcontroller.Ranking_monthAjaxController;
import kr.valkyrie.ajaxcontroller.Ranking_weekAjaxController;
import kr.valkyrie.ajaxcontroller.WSTimeStatisticsAjaxController;
import kr.valkyrie.ajaxcontroller.WSTimeStatisticsController;
import kr.valkyrie.controller.ArduinoController;
import kr.valkyrie.controller.BoardAnswerContentController;
import kr.valkyrie.controller.BoardContent_answerController;
import kr.valkyrie.controller.BoardInsertController;
import kr.valkyrie.controller.BoardListController;
import kr.valkyrie.controller.BoardList_adminController;
import kr.valkyrie.controller.Controller;
import kr.valkyrie.controller.LearningStatus_dayController;
import kr.valkyrie.controller.LearningStatus_monthController;
import kr.valkyrie.controller.LearningStatus_weekController;
import kr.valkyrie.controller.MemberInsertController;
import kr.valkyrie.controller.MemberLoginController;
import kr.valkyrie.controller.MemberLogoutController;
import kr.valkyrie.controller.Ranking_dayController;
import kr.valkyrie.controller.Ranking_monthController;
import kr.valkyrie.controller.Ranking_weekController;
import kr.valkyrie.controller.TimeSetInsertController;
import kr.valkyrie.controller.TimeSetSelectController;
import kr.valkyrie.controller.USTimeController;
import kr.valkyrie.controller.USTimeUSecUpdateController;

@WebServlet("*.do")
public class ValkyrieController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("EUC-KR");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter out = response.getWriter();

		String reqPath = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = reqPath.substring(contextPath.length());

		Controller controller = null;
		AjaxController ajaxController = null;
		String nextPage = null;
		String jsonArr = null;
		JsonObject jsonObj = null;

		if (command.equals("/memberInsert.do")) {
			controller = new MemberInsertController();
			nextPage = controller.requestHandler(request, response);
			response.sendRedirect(nextPage);
		} else if (command.equals("/memberLogin.do")) {
			controller = new MemberLoginController();
			nextPage = controller.requestHandler(request, response);
			response.sendRedirect(nextPage);
		} else if (command.equals("/arduino.do")) {
			controller = new ArduinoController();
			String statusJson = controller.requestHandler(request, response);
			response.getWriter().println(statusJson);
		} else if (command.equals("/memberLogout.do")) {
			controller = new MemberLogoutController();
			nextPage = controller.requestHandler(request, response);
			response.sendRedirect(nextPage);
		} else if (command.equals("/timeSetSelect.do")) {
			controller = new TimeSetSelectController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/timeSetInsert.do")) {
			controller = new TimeSetInsertController();
			nextPage = controller.requestHandler(request, response);
			response.sendRedirect(nextPage);
		} else if (command.equals("/uSTime.do")) {
			controller = new USTimeController();
			nextPage = controller.requestHandler(request, response);
			response.sendRedirect(nextPage);
		} else if (command.equals("/uSTimeUSecUpdate.do")) {
			controller = new USTimeUSecUpdateController();
			nextPage = controller.requestHandler(request, response);
			response.sendRedirect(nextPage);
		} else if (command.equals("/boardList.do")) {
			controller = new BoardListController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/boardContent_answer.do")) {
			controller = new BoardContent_answerController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/boardAnswerContent.do")) {
			controller = new BoardAnswerContentController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/boardList_admin.do")) {
			controller = new BoardList_adminController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/boardInsert.do")) {
			controller = new BoardInsertController();
			nextPage = controller.requestHandler(request, response);
			response.sendRedirect(nextPage);
		} else if (command.equals("/learningStatus_day.do")) {
			controller = new LearningStatus_dayController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/dSTimeStatistics.do")) {
			ajaxController = new DSTimeStatisticsController();
			jsonObj = ajaxController.requestHandler(request, response);
			out.print(jsonObj);
		} else if (command.equals("/learningStatus_week.do")) {
			controller = new LearningStatus_weekController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/wSTimeStatistics.do")) {
			ajaxController = new WSTimeStatisticsController();
			jsonObj = ajaxController.requestHandler(request, response);
			out.print(jsonObj);
		} else if (command.equals("/wSTimeStatisticsAjax.do")) {
			controller = new WSTimeStatisticsAjaxController();
			jsonArr = controller.requestHandler(request, response);
			out.print(jsonArr);
		} else if (command.equals("/learningStatus_month.do")) {
			controller = new LearningStatus_monthController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/mSTimeStatistics.do")) {
			ajaxController = new MSTimeStatisticsController();
			jsonObj = ajaxController.requestHandler(request, response);
			out.print(jsonObj);
		} else if (command.equals("/mSTimeStatisticsAjax.do")) {
			controller = new MSTimeStatisticsAjaxController();
			jsonArr = controller.requestHandler(request, response);
			out.print(jsonArr);
		} else if (command.equals("/ranking_day.do")) {
			controller = new Ranking_dayController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/ranking_dayAjax.do")) {
			controller = new Ranking_dayAjaxController();
			jsonArr = controller.requestHandler(request, response);
			out.print(jsonArr);
		} else if (command.equals("/ranking_week.do")) {
			controller = new Ranking_weekController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/ranking_weekAjax.do")) {
			controller = new Ranking_weekAjaxController();
			jsonArr = controller.requestHandler(request, response);
			out.print(jsonArr);
		} else if (command.equals("/ranking_month.do")) {
			controller = new Ranking_monthController();
			nextPage = controller.requestHandler(request, response);
			RequestDispatcher rd = request.getRequestDispatcher(nextPage);
			rd.forward(request, response);
		} else if (command.equals("/ranking_monthAjax.do")) {
			controller = new Ranking_monthAjaxController();
			jsonArr = controller.requestHandler(request, response);
			out.print(jsonArr);
		}

	}

}
