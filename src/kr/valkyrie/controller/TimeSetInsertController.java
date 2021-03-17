package kr.valkyrie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.TimeSetDAO;
import kr.valkyrie.model.TimeSetVO;

public class TimeSetInsertController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");
		int studyMin = Integer.parseInt(request.getParameter("studyMin"));
		int restMin = Integer.parseInt(request.getParameter("restMin"));
		TimeSetVO vo = new TimeSetVO(nickName, studyMin, restMin);
		
		TimeSetDAO dao = new TimeSetDAO();
		dao.timeSetUpadate(vo);
		
		return "uSTime.do?study=study1";
		
	}

}
