package kr.valkyrie.ajaxcontroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.valkyrie.controller.Controller;
import kr.valkyrie.model.TimeUtil;
import kr.valkyrie.model.WSTimeDAO;
import kr.valkyrie.model.WSTimeVO;

public class Ranking_weekAjaxController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String ctgry = (String) session.getAttribute("ctgry");
		
		String direction = request.getParameter("direction");
		String sWeek = request.getParameter("sWeek");
		
		WSTimeDAO dao = new WSTimeDAO();
		String jsonArr = "";
		ArrayList<WSTimeVO> list = new ArrayList<WSTimeVO>();
		if(direction.equals("left")) {
			String previousSWeek = dao.previousSWeek(sWeek);
			String previousEWeek = dao.eWeekSelect(previousSWeek);
			list = dao.wSTimeRanking(previousSWeek, ctgry);
			if(list.size() == 0) {
				WSTimeVO vo = new WSTimeVO();
				vo.setRank(0);
				vo.setsWeek(previousSWeek);
				vo.seteWeek(previousEWeek);
				vo.setNickName("-");
				vo.setwTime("-");
				list.add(vo);
			}
		}else if(direction.equals("right")) {
			String nextSWeek = dao.nextSWeek(sWeek);
			String nextEWeek = dao.eWeekSelect(nextSWeek);
			list = dao.wSTimeRanking(nextSWeek, ctgry);
			if(list.size() == 0) {
				WSTimeVO vo = new WSTimeVO();
				vo.setRank(0);
				vo.setsWeek(nextSWeek);
				vo.seteWeek(nextEWeek);
				vo.setNickName("-");
				vo.setwTime("-");
				list.add(vo);
			}
		}
		for(int i = 0; i < list.size(); i++) {
			int wSec = list.get(i).getwSec();
			TimeUtil tu = new TimeUtil();
			String wTime = tu.secToTime(wSec);
			list.get(i).setwTime(wTime);
		}
		Gson gson = new Gson();
		jsonArr = gson.toJson(list);
		return jsonArr;
	}

}
