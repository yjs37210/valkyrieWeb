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

public class MSTimeStatisticsAjaxController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");
		int yy = Integer.parseInt(request.getParameter("yy"));
		int mm = Integer.parseInt(request.getParameter("mm"));
		int day = Integer.parseInt(request.getParameter("day"));

		String dDay = LocalDate.of(yy, mm, day).format(DateTimeFormatter.ISO_DATE);
		String month = dDay.substring(0, 7);

		// 한달간 막대그래프
		DSTimeDAO dao = new DSTimeDAO();
		month += "-01";
		ArrayList<String> monthlyDays = dao.monthlyDay(month, nickName);
		ArrayList<DSTimeVO> realDays = dao.dSTimeMonthlySelect(month, nickName);
		ArrayList<DSTimeVO> dataList = new ArrayList<DSTimeVO>();
		
		for (int i = 0; i < monthlyDays.size(); i++) {
			DSTimeVO dataVo = new DSTimeVO();
			dataVo.setdDay(monthlyDays.get(i));
			int cnt = 0;
			for (int j = 0; j < realDays.size(); j++) {
				if (monthlyDays.get(i).equals(realDays.get(j).getdDay())) {
					dataVo.setdSec(realDays.get(j).getdSec());
					dataVo.setdTime(realDays.get(j).getdTime());
					cnt++;
				}
			}
			if (cnt == 0) {
				dataVo.setdSec(0);
				dataVo.setdTime("00:00:00");
			}
			dataList.add(dataVo);
		}
		
		while(dataList.size() < 31) {
			DSTimeVO dataVo = new DSTimeVO(dDay, 0, "00:00:00");
			dataList.add(dataVo);
		}
		
		Gson gson = new Gson();
		String jsonArr = gson.toJson(dataList);
		return jsonArr;
	}

}
