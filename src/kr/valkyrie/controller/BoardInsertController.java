package kr.valkyrie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.BoardDAO;
import kr.valkyrie.model.BoardVO;

public class BoardInsertController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String nickName = (String)session.getAttribute("nickName");
		String bPw = request.getParameter("bPw");
		String bEmail = request.getParameter("bEmail");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		BoardVO vo = new BoardVO(bPw, nickName, bEmail, title, content);
		BoardDAO dao = new BoardDAO();
		int cnt = dao.boardInsert(vo);
		
		String nextPage = "";
		if(cnt>0) {
			nextPage = "boardList.do";
		}else {
			throw new ServletException("인서트 실패");
		}
		
		return nextPage;
	}

}
