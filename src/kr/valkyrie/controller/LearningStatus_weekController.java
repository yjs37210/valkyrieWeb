package kr.valkyrie.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.DSTimeDAO;
import kr.valkyrie.model.DSTimeVO;
import kr.valkyrie.model.TimeUtil;
import kr.valkyrie.model.WSTimeDAO;
import kr.valkyrie.model.WSTimeVO;

public class LearningStatus_weekController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DSTimeDAO dao = new DSTimeDAO();
		String dDay = dao.now();
		
		WSTimeDAO wSTimeDao = new WSTimeDAO();
		String sWeek = wSTimeDao.sWeekSelect(dDay);
		String eWeek = wSTimeDao.eWeekSelect(dDay);
		
		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");
		WSTimeVO vo = wSTimeDao.WSecSelect(nickName, sWeek);
		vo.setsWeek(sWeek);
		vo.seteWeek(eWeek);
		
		String wTime = "00:00:00";
		String avgWTime = "00:00:00";
		String restWTime = "00:00:00";
		
		TimeUtil tu = new TimeUtil();
		if(vo.getwSec() > 0) {

			LocalDate l_sWeek = tu.toLocalDate(sWeek);
			LocalDate l_dDay = tu.toLocalDate(dDay);
			int difference = (int) ChronoUnit.DAYS.between(l_sWeek, l_dDay); 

			int avgWSec = vo.getwSec() / 7;
			if(difference < 7) {
				avgWSec = vo.getwSec() / (difference + 1);
			}
			
			wTime = tu.secToTime(vo.getwSec());
			avgWTime = tu.secToTime(avgWSec);
			restWTime = tu.secToTime(vo.getRestWSec());
		}else {
			vo.setwSec(0);
			vo.setRestWSec(0);
		}

		vo.setwTime(wTime);
		vo.setAvgWTime(avgWTime);
		vo.setRestWTime(restWTime);
		
		// 일주일간 막대그래프
		ArrayList<String> weeklyDays = dao.weeklyDay(sWeek);
		ArrayList<DSTimeVO> realDays = dao.dSTimeWeeklySelect(sWeek, nickName);
		ArrayList<DSTimeVO> dataList = new ArrayList<DSTimeVO>();
		for(int i = 0; i < weeklyDays.size(); i++) {
			DSTimeVO dataVo = new DSTimeVO();
			dataVo.setdDay(weeklyDays.get(i));
			int cnt = 0;
			for(int j = 0; j < realDays.size(); j++) {
				if(weeklyDays.get(i).equals(realDays.get(j).getdDay())) {
					dataVo.setdSec(realDays.get(j).getdSec());
					cnt++;
				}
			}
			if(cnt == 0) {
				dataVo.setdSec(0);
			}
			dataList.add(dataVo);
		}
		
		request.setAttribute("dataList", dataList);
		request.setAttribute("vo", vo);
		
		return "learningStatus_week.jsp";
	}

}
