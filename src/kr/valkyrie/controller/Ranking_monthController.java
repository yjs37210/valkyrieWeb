package kr.valkyrie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.DSTimeDAO;
import kr.valkyrie.model.MSTimeDAO;
import kr.valkyrie.model.MSTimeVO;
import kr.valkyrie.model.MemberDAO;
import kr.valkyrie.model.MemberVO;
import kr.valkyrie.model.TimeUtil;

public class Ranking_monthController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String ctgry = (String) session.getAttribute("ctgry");
		DSTimeDAO dao = new DSTimeDAO();
		String dDay = dao.now();
		
		MSTimeDAO mSTimeDao = new MSTimeDAO();
		String month = dDay.substring(0, 7);
		ArrayList<MSTimeVO> list = mSTimeDao.mSTimeRanking(month, ctgry);
		for(int i = 0; i < list.size(); i++) {
			int mSec = list.get(i).getmSec();
			TimeUtil tu = new TimeUtil();
			String mTime = tu.secToTime(mSec);
			list.get(i).setmTime(mTime);
		}
		if(list.size() == 0) {
			MSTimeVO vo = new MSTimeVO("-","-",0);
			list.add(vo);
		}
		
		MemberDAO memDao = new MemberDAO();
		ArrayList<MemberVO> ctgryList = memDao.ctgryNumSelect();
		request.setAttribute("ctgryList", ctgryList);
		request.setAttribute("month", month);
		request.setAttribute("list", list);

		return "ranking_month.jsp";
	}

}
