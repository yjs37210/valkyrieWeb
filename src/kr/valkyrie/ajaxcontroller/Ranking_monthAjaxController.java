package kr.valkyrie.ajaxcontroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.valkyrie.controller.Controller;
import kr.valkyrie.model.MSTimeDAO;
import kr.valkyrie.model.MSTimeVO;
import kr.valkyrie.model.TimeUtil;

public class Ranking_monthAjaxController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String ctgry = (String) session.getAttribute("ctgry");
		String direction = request.getParameter("direction");
		String month = request.getParameter("month");
		
		MSTimeDAO dao = new MSTimeDAO();
		ArrayList<MSTimeVO> list = new ArrayList<MSTimeVO>();
		if(direction.equals("left")) {
			month+="01";
			String previousMonth = dao.previousMonth(month);
			list = dao.mSTimeRanking(previousMonth, ctgry);
			if(list.size() == 0) {
				MSTimeVO vo = new MSTimeVO("-",previousMonth,"-",0);
				list.add(vo);
			}
		}else if(direction.equals("right")) {
			month+="28";
			String nextMonth = dao.nextMonth(month);
			list = dao.mSTimeRanking(nextMonth, ctgry);
			if(list.size() == 0) {
				MSTimeVO vo = new MSTimeVO("-",nextMonth,"-",0);
				list.add(vo);
			}
		}
		for(int i = 0; i < list.size(); i++) {
			int mSec = list.get(i).getmSec();
			TimeUtil tu = new TimeUtil();
			String mTime = tu.secToTime(mSec);
			list.get(i).setmTime(mTime);
		}
		Gson gson = new Gson();
		String jsonArr = gson.toJson(list);
		return jsonArr;
	}

}
