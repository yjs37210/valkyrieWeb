package kr.valkyrie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.MemberDAO;
import kr.valkyrie.model.MemberVO;

public class MemberLoginController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDAO dao = new MemberDAO();
		boolean succ = dao.isLogin(id, pw);
		String nextPage = "";
		
		if(succ) {
			MemberVO vo = dao.memberContentId(id);
			
			HttpSession session = request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("nickName", vo.getNickName());
			session.setAttribute("ctgry", vo.getCtgry());
			session.setAttribute("admin", vo.getAdmin());
			
			if(vo.getAdmin() == 1) {
				nextPage = "admin.jsp";
			}else {
				String statusJson = "/{\"a\":2,\"b\":" + id + "}/";
				response.getWriter().println(statusJson);
				nextPage = "index.jsp";
			}
		}else {
			nextPage = "memberLogin.jsp";
		}
		
		return nextPage;
	}

}
