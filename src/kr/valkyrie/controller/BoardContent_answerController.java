package kr.valkyrie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.BoardDAO;
import kr.valkyrie.model.BoardVO;

public class BoardContent_answerController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		int admin = (int) session.getAttribute("admin");
		int bNum = Integer.parseInt(request.getParameter("bNum"));
	
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.boardContent(bNum);
		request.setAttribute("vo", vo);
		
		String nextPage = "";
		if(admin == 1) {
			nextPage = "admin_contact_write.jsp";
		}else {
			nextPage = "boardContent.jsp";
		}
		return nextPage;
	}

}
