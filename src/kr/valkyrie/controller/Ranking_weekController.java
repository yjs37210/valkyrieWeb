package kr.valkyrie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.DSTimeDAO;
import kr.valkyrie.model.MemberDAO;
import kr.valkyrie.model.MemberVO;
import kr.valkyrie.model.TimeUtil;
import kr.valkyrie.model.WSTimeDAO;
import kr.valkyrie.model.WSTimeVO;

public class Ranking_weekController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String ctgry = (String) session.getAttribute("ctgry");
		DSTimeDAO dao = new DSTimeDAO();
		String dDay = dao.now();

		WSTimeDAO wSTimeDao = new WSTimeDAO();
		String sWeek = wSTimeDao.sWeekSelect(dDay);
		String eWeek = wSTimeDao.eWeekSelect(dDay);
		ArrayList<WSTimeVO> list = wSTimeDao.wSTimeRanking(sWeek, ctgry);
		for(int i = 0; i < list.size(); i++) {
			int wSec = list.get(i).getwSec();
			TimeUtil tu = new TimeUtil();
			String wTime = tu.secToTime(wSec);
			list.get(i).setwTime(wTime);
		}
		
		if(list.size() == 0) {
			WSTimeVO vo = new WSTimeVO("-","-",0);
			list.add(vo);
		}
		
		MemberDAO memDao = new MemberDAO();
		ArrayList<MemberVO> ctgryList = memDao.ctgryNumSelect();
		request.setAttribute("ctgryList", ctgryList);
		request.setAttribute("sWeek", sWeek);
		request.setAttribute("eWeek", eWeek);
		request.setAttribute("list", list);

		return "ranking_week.jsp";
	}

}
