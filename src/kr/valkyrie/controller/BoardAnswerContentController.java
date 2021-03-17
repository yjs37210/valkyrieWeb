package kr.valkyrie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.valkyrie.model.BoardDAO;
import kr.valkyrie.model.BoardVO;

public class BoardAnswerContentController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nextPage = "";
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		String a_content = request.getParameter("a_content");
		
		BoardVO vo = new BoardVO(bNum, a_content);
		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardAnswerInsert(vo);
		if(cnt > 0) {
			vo = dao.boardContent(bNum);
			request.setAttribute("vo", vo);
			nextPage = "boardList_admin.do";
		}else {
			throw new ServletException("error");
		}
		
		return nextPage;
	}

}
