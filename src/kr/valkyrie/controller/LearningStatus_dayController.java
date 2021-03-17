package kr.valkyrie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.DSTimeDAO;
import kr.valkyrie.model.DSTimeVO;
import kr.valkyrie.model.TimeUtil;

public class LearningStatus_dayController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");

		DSTimeDAO dao = new DSTimeDAO();
		String dDay = dao.now();
		DSTimeVO vo = dao.dSecSelect(nickName, dDay);

		String dTime = "00:00:00";
		String restDTime = "00:00:00";
		String studyStart = "00:00:00";
		String studyEnd = "00:00:00";

		if (vo.getdSec() > 0) {
			TimeUtil tu = new TimeUtil();
			dTime = tu.secToTime(vo.getdSec());
			restDTime = tu.secToTime(vo.getRestDSec());
			studyStart = dao.studyStartSelect(vo);
			studyEnd = dao.studyEndSelect(vo);
		}
		
		vo.setdTime(dTime);
		vo.setRestDTime(restDTime);
		vo.setStudyStart(studyStart);
		vo.setStudyEnd(studyEnd);

		request.setAttribute("vo", vo);

		return "learningStatus_day.jsp";
	}

}
