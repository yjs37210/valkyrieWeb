package kr.valkyrie.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.DSTimeDAO;
import kr.valkyrie.model.DSTimeVO;
import kr.valkyrie.model.MSTimeDAO;
import kr.valkyrie.model.MSTimeVO;
import kr.valkyrie.model.TimeUtil;

public class LearningStatus_monthController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DSTimeDAO dao = new DSTimeDAO();
		String dDay = dao.now();
		int dDay_int = Integer.parseInt(dDay.substring(8, 10));
		
		MSTimeDAO mSTimeDao = new MSTimeDAO();
		String month = mSTimeDao.monthSelect(dDay);

		HttpSession session = request.getSession();
		String nickName = (String)session.getAttribute("nickName");
		MSTimeVO vo = mSTimeDao.mTimeSelect(nickName, month);
		vo.setMonth(month);
		vo.setNickName(nickName);
		
		String mTime = "00:00:00";
		String avgMTime = "00:00:00";
		String restMTime = "00:00:00";
		
		TimeUtil tu = new TimeUtil();
		if(vo.getmSec() > 0) {
			int avgMSec = vo.getmSec() / dDay_int;
			mTime = tu.secToTime(vo.getmSec());
			avgMTime = tu.secToTime(avgMSec);
			restMTime = tu.secToTime(vo.getRestMSec());
		}else {
			vo.setmSec(0);
			vo.setRestMSec(0);
		}
		
		vo.setmTime(mTime);
		vo.setAvgMTime(avgMTime);
		vo.setRestMTime(restMTime);
		
		// 한달간 막대그래프
		month += "-01";
		ArrayList<String> monthlyDays = dao.monthlyDay(month, nickName);
		ArrayList<DSTimeVO> realDays = dao.dSTimeMonthlySelect(month, nickName);
		ArrayList<DSTimeVO> dataList = new ArrayList<DSTimeVO>();
		for(int i = 0; i < monthlyDays.size(); i++) {
			DSTimeVO dataVo = new DSTimeVO();
			dataVo.setdDay(monthlyDays.get(i));
			int cnt = 0;
			for(int j = 0; j < realDays.size(); j++) {
				if(monthlyDays.get(i).equals(realDays.get(j).getdDay())) {
					dataVo.setdSec(realDays.get(j).getdSec());
					cnt++;
				}
			}
			if(cnt == 0) {
				dataVo.setdSec(0);
			}
			dataList.add(dataVo);
		}
		
		int[] data = new int[monthlyDays.size()];
		for(int i = 0; i < monthlyDays.size(); i++) {
			data[i] = dataList.get(i).getdSec();
		}
		
		request.setAttribute("data", data);
		request.setAttribute("dataList", dataList);
		request.setAttribute("vo", vo);
		
		return "learningStatus_month.jsp";
	}

}
