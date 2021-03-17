package kr.valkyrie.ajaxcontroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.valkyrie.controller.Controller;
import kr.valkyrie.model.DSTimeDAO;
import kr.valkyrie.model.DSTimeVO;
import kr.valkyrie.model.TimeUtil;

public class Ranking_dayAjaxController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String ctgry = (String) session.getAttribute("ctgry");
		
		String direction = request.getParameter("direction");
		String dDay = request.getParameter("dDay");
		
		DSTimeDAO dao = new DSTimeDAO();
		ArrayList<DSTimeVO> list = new ArrayList<DSTimeVO>();
		if(direction.equals("left")) {
			String yesterDay = dao.yesterDay(dDay);
			list = dao.dSTimeRanking(yesterDay, ctgry);
			if(list.size() == 0) {
				DSTimeVO vo = new DSTimeVO(0, yesterDay, "-", "-");
				list.add(vo);
			}
		}else if(direction.equals("right")) {
			String tomorrow = dao.tomorrow(dDay);
			list = dao.dSTimeRanking(tomorrow, ctgry);
			if(list.size() == 0) {
				DSTimeVO vo = new DSTimeVO(0, tomorrow, "-", "-");
				list.add(vo);
			}
		}

		for(int i = 0; i < list.size(); i++) {
			int dSec = list.get(i).getdSec();
			TimeUtil tu = new TimeUtil();
			String dTime = tu.secToTime(dSec);
			list.get(i).setdTime(dTime);
		}
		
		String jsonArr = "";
		Gson gson = new Gson();
		jsonArr = gson.toJson(list);
		return jsonArr;
	}

}
