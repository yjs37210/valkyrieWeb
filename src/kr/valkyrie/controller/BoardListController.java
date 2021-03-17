package kr.valkyrie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.valkyrie.model.BoardDAO;
import kr.valkyrie.model.BoardVO;

public class BoardListController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> list = dao.boardAllList();
		request.setAttribute("list", list);
		return "contact.jsp";
		
	}

}
