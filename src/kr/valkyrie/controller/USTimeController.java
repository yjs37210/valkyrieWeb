package kr.valkyrie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.StudyStatusDAO;
import kr.valkyrie.model.USTimeDAO;

public class USTimeController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String study = request.getParameter("study");
		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");
		String id = (String) session.getAttribute("id");
		
		StudyStatusDAO studyStatusDao = new StudyStatusDAO();
		USTimeDAO dao = new USTimeDAO();
		
		String nextPage = "";
		int cnt = -1;
		if(study.equals("study1")) {
			cnt = dao.uSTimeStartInsert(nickName);
			if (cnt <= 0) {
				throw new ServletException("uSTimeStartInsert error");
			}
			cnt = studyStatusDao.statusUpdateTo1(id);
			if (cnt <= 0) {
				throw new ServletException("statusUpdateTo1 error");
			}
			nextPage = "timeSetSelect.do";
		}else if(study.equals("study0")) {
			cnt = dao.uSTimeEndUpdate(nickName);
			if (cnt <= 0) {
				throw new ServletException("uSTimeEndUpdate error");
			}
			cnt = studyStatusDao.statusUpdateTo0(id);
			if (cnt <= 0) {
				throw new ServletException("statusUpdateTo0 error");
			}
			nextPage = "uSTimeUSecUpdate.do";
		}
		
		return nextPage;
	}

}
