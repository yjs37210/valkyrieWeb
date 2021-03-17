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
import kr.valkyrie.model.DSTimeVO;
import kr.valkyrie.model.TimeUtil;

public class DSTimeStatisticsController implements AjaxController {

	public JsonObject requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");
		int yy = Integer.parseInt(request.getParameter("yy"));
		int mm = Integer.parseInt(request.getParameter("mm"));
		int day = Integer.parseInt(request.getParameter("day"));
		String dDay = LocalDate.of(yy, mm, day).format(DateTimeFormatter.ISO_DATE);

		DSTimeDAO dao = new DSTimeDAO();
		DSTimeVO vo = dao.dSecSelect(nickName, dDay);

		String dTime = "00:00:00";
		String restDTime = "00:00:00";
		String studyStart = "00:00:00";
		String studyEnd = "00:00:00";
		
		if(vo.getdSec() > 0) {
			TimeUtil tu = new TimeUtil();
			dTime = tu.secToTime(vo.getdSec());
			restDTime = tu.secToTime(vo.getRestDSec());
			studyStart = dao.studyStartSelect(vo).substring(11);
			studyEnd = dao.studyEndSelect(vo).substring(11);
		}else {
			vo.setdSec(0);
			vo.setRestDSec(0);
		}
		
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("studyStart", studyStart);
		jsonObj.addProperty("studyEnd", studyEnd);
		jsonObj.addProperty("dSec", vo.getdSec());
		jsonObj.addProperty("restDSec", vo.getRestDSec());
		jsonObj.addProperty("dTime", dTime);
		jsonObj.addProperty("restDTime",  restDTime);

		return jsonObj;
	}

}
