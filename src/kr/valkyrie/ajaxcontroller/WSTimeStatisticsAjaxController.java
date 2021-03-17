package kr.valkyrie.ajaxcontroller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.valkyrie.controller.Controller;
import kr.valkyrie.model.DSTimeDAO;
import kr.valkyrie.model.DSTimeVO;
import kr.valkyrie.model.WSTimeDAO;

public class WSTimeStatisticsAjaxController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");
		int yy = Integer.parseInt(request.getParameter("yy"));
		int mm = Integer.parseInt(request.getParameter("mm"));
		int day = Integer.parseInt(request.getParameter("day"));

		String dDay = LocalDate.of(yy, mm, day).format(DateTimeFormatter.ISO_DATE);

		WSTimeDAO wSTimeDao = new WSTimeDAO();
		String sWeek = wSTimeDao.sWeekSelect(dDay);

		// 일주일간 막대그래프
		DSTimeDAO dao = new DSTimeDAO();
		ArrayList<String> weeklyDays = dao.weeklyDay(sWeek);
		ArrayList<DSTimeVO> realDays = dao.dSTimeWeeklySelect(sWeek, nickName);
		ArrayList<DSTimeVO> dataList = new ArrayList<DSTimeVO>();
		for (int i = 0; i < weeklyDays.size(); i++) {
			DSTimeVO dataVo = new DSTimeVO();
			dataVo.setdDay(weeklyDays.get(i));
			int cnt = 0;
			for (int j = 0; j < realDays.size(); j++) {
				if (weeklyDays.get(i).equals(realDays.get(j).getdDay())) {
					dataVo.setdSec(realDays.get(j).getdSec());
					cnt++;
				}
			}
			if (cnt == 0) {
				dataVo.setdSec(0);
			}
			dataList.add(dataVo);
		}

		Gson gson = new Gson();
		String jsonArr = gson.toJson(dataList);

		return jsonArr;
	}

}
