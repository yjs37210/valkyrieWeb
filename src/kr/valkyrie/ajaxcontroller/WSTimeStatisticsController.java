package kr.valkyrie.ajaxcontroller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import kr.valkyrie.model.DSTimeDAO;
import kr.valkyrie.model.TimeUtil;
import kr.valkyrie.model.WSTimeDAO;
import kr.valkyrie.model.WSTimeVO;

public class WSTimeStatisticsController implements AjaxController {

	@Override
	public JsonObject requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");
		int yy = Integer.parseInt(request.getParameter("yy"));
		int mm = Integer.parseInt(request.getParameter("mm"));
		int day = Integer.parseInt(request.getParameter("day"));
		String dDay = LocalDate.of(yy, mm, day).format(DateTimeFormatter.ISO_DATE);

		WSTimeDAO wSTimeDao = new WSTimeDAO();
		String sWeek = wSTimeDao.sWeekSelect(dDay);
		WSTimeVO vo = wSTimeDao.WSecSelect(nickName, sWeek);

		String wTime = "00:00:00";
		String avgWTime = "00:00:00";
		String restWTime = "00:00:00";
		
		TimeUtil tu = new TimeUtil();
		if(vo.getwSec() > 0) {
			DSTimeDAO dstdao = new DSTimeDAO();
			String dDay_now = dstdao.now();
			LocalDate l_sWeek = tu.toLocalDate(sWeek);
			LocalDate l_dDay = tu.toLocalDate(dDay_now);
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

		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("wSec", vo.getwSec());
		jsonObj.addProperty("wTime", wTime);
		jsonObj.addProperty("avgWTime", avgWTime);
		jsonObj.addProperty("restWSec", vo.getRestWSec());
		jsonObj.addProperty("restWTime", restWTime);

		return jsonObj;
	}

}
