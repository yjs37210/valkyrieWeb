package kr.valkyrie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.valkyrie.model.MemberDAO;
import kr.valkyrie.model.MemberVO;

public class MemberInsertController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nickName = request.getParameter("nickName");
		String gender = request.getParameter("gender");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		String ctgry = request.getParameter("ctgry");

		MemberVO vo = new MemberVO(id, pw, name, nickName, gender, tel, email, addr, ctgry);
		MemberDAO dao = new MemberDAO();
		int cnt = dao.memberInsert(vo);
		if (cnt <= 0) {
			throw new ServletException("memberInsert error");
		}
		cnt = dao.memberTimeSetInsert(nickName);
		if (cnt <= 0) {
			throw new ServletException("memberTimeSetInsert error");
		}
		cnt = dao.memberStudyStatusInsert(id);
		if (cnt <= 0) {
			throw new ServletException("memberStudyStatusInsert error");
		}
		
		return "memberLogin.jsp";
	}

	
	
}
