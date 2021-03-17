package kr.valkyrie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.TimeSetDAO;
import kr.valkyrie.model.TimeSetVO;

public class TimeSetSelectController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");
		
		TimeSetDAO dao = new TimeSetDAO();
		TimeSetVO vo = dao.timeSetSelect(nickName);
		
		request.setAttribute("vo", vo);
		return "study.jsp";
		
	}

}
