package kr.valkyrie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.DSTimeDAO;
import kr.valkyrie.model.DSTimeVO;
import kr.valkyrie.model.MemberDAO;
import kr.valkyrie.model.MemberVO;
import kr.valkyrie.model.TimeUtil;

public class Ranking_dayController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String ctgry = (String) session.getAttribute("ctgry");
		DSTimeDAO dao = new DSTimeDAO();
		String dDay = dao.now();
		
		ArrayList<DSTimeVO> list = dao.dSTimeRanking(dDay, ctgry);
		for(int i = 0; i < list.size(); i++) {
			int dSec = list.get(i).getdSec();
			TimeUtil tu = new TimeUtil();
			String dTime = tu.secToTime(dSec);
			list.get(i).setdTime(dTime);
		}
		
		if(list.size() == 0) {
			DSTimeVO vo = new DSTimeVO(0,"-","-");
			list.add(vo);
		}

		MemberDAO memDao = new MemberDAO();
		ArrayList<MemberVO> ctgryList = memDao.ctgryNumSelect();
		request.setAttribute("ctgryList", ctgryList);
		request.setAttribute("dDay", dDay);
		request.setAttribute("list", list);
		
		return "ranking_day.jsp";
	}

}
