package kr.valkyrie.ajaxcontroller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import kr.valkyrie.model.DSTimeDAO;
import kr.valkyrie.model.MSTimeDAO;
import kr.valkyrie.model.MSTimeVO;
import kr.valkyrie.model.TimeUtil;

public class MSTimeStatisticsController implements AjaxController {

	@Override
	public JsonObject requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");
		int yy = Integer.parseInt(request.getParameter("yy"));
		int mm = Integer.parseInt(request.getParameter("mm"));
		int day = Integer.parseInt(request.getParameter("day"));
		String dDay = LocalDate.of(yy, mm, day).format(DateTimeFormatter.ISO_DATE);
		String month = dDay.substring(0, 7);
		String month_now = LocalDate.now().format(DateTimeFormatter.ISO_DATE).substring(0, 7);
		DSTimeDAO dstdao = new DSTimeDAO();
		String dDay_now = dstdao.now();
		int dDay_int = Integer.parseInt(dDay_now.substring(8, 10));
		
		MSTimeDAO dao = new MSTimeDAO();
		String firstDay = month + "-01";
		String lastDay = dao.lastDaySelect(firstDay);
		int lastDay_int = Integer.parseInt(lastDay.substring(8, 10));
		MSTimeVO vo = dao.mTimeSelect(nickName, month);
		
		String mTime = "00:00:00";
		String avgMTime = "00:00:00";
		String restMTime = "00:00:00";
		
		TimeUtil tu = new TimeUtil();
		if(vo.getmSec() > 0) {
			
			int avgMSec = vo.getmSec() / lastDay_int;
			if(month.equals(month_now)) {
				avgMSec = vo.getmSec() / dDay_int;
			}
			
			mTime = tu.secToTime(vo.getmSec());
			avgMTime = tu.secToTime(avgMSec);
			restMTime = tu.secToTime(vo.getRestMSec());
			
		}else {
			vo.setmSec(0);
			vo.setRestMSec(0);
		}
		
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("mSec", vo.getmSec());
		jsonObj.addProperty("mTime", mTime);
		jsonObj.addProperty("avgMTime", avgMTime);
		jsonObj.addProperty("restMSec", vo.getRestMSec());
		jsonObj.addProperty("restMTime", restMTime);
		
		return jsonObj;
	}

}
