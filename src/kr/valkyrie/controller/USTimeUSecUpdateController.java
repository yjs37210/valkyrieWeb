package kr.valkyrie.controller;

import java.io.IOException;
import java.time.LocalTime;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.valkyrie.model.TimeSetDAO;
import kr.valkyrie.model.TimeSetVO;
import kr.valkyrie.model.TimeUtil;
import kr.valkyrie.model.USTimeDAO;
import kr.valkyrie.model.USTimeVO;

public class USTimeUSecUpdateController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String nickName = (String) session.getAttribute("nickName");

		USTimeDAO dao = new USTimeDAO();
		ArrayList<USTimeVO> list = dao.uSTimeSelect(nickName);

		int cnt = 0;
		for (int i = 0; i < list.size(); i++) {

			USTimeVO vo = list.get(i);
			String uStart = vo.getuStart();
			String uEnd = vo.getuEnd();

			TimeSetDAO tsdao = new TimeSetDAO();
			TimeSetVO tsvo = tsdao.timeSetSelect(nickName);
			int studyMin = tsvo.getStudyMin();
			int restMin = tsvo.getRestMin();

			if (uStart.substring(0, 10).equals(uEnd.substring(0, 10)) || uEnd.substring(11).equals("00:00:00")) {

				TimeUtil timeUtil = new TimeUtil();
				LocalTime l_uStart = timeUtil.toLocalTime(uStart);
				LocalTime l_uEnd = timeUtil.toLocalTime(uEnd);

				int uSec = (int) l_uStart.until(l_uEnd, ChronoUnit.SECONDS);
				int realStudyUSec = timeUtil.realUSec(uSec, studyMin, restMin).getRealStudyUSec();
				int realRestUSec = timeUtil.realUSec(uSec, studyMin, restMin).getRealRestUSec();
				vo.setuSec(uSec);
				vo.setRealStudyUSec(realStudyUSec);
				vo.setRealRestUSec(realRestUSec);

				cnt = dao.uSTimeSecUpdate(vo);

			} else { // 자정 꼈을 때
				// 자정 이전
				String midnight = uEnd.substring(0, 10);
				midnight += " 00:00:00";

				vo.setuStart(uStart);
				vo.setuEnd(midnight);
				cnt = dao.uSTimeMidnightStart(vo);
				if (cnt <= 0) {
					throw new ServletException("uSTimeMidnightStart error");
				}

				TimeUtil timeUtil = new TimeUtil();
				LocalTime l_uStart = timeUtil.toLocalTime(uStart);
				LocalTime l_midnight = timeUtil.toLocalTime(midnight);

				int uSec = (int) l_uStart.until(l_midnight, ChronoUnit.SECONDS);
				uSec += 86400;
				vo.setuSec(uSec);

				int realStudyUSec = timeUtil.realUSec(uSec, studyMin, restMin).getRealStudyUSec();
				int realRestUSec = timeUtil.realUSec(uSec, studyMin, restMin).getRealRestUSec();

				vo.setRealStudyUSec(realStudyUSec);
				vo.setRealRestUSec(realRestUSec);
				cnt = dao.uSTimeSecUpdate(vo);
				if (cnt <= 0) {
					throw new ServletException("uSTimeSecUpdate error");
				}

				// 자정 이후
				vo.setuStart(midnight);
				vo.setuEnd(uEnd);
				cnt = dao.uSTimeMidnightEnd(vo);
				if (cnt <= 0) {
					throw new ServletException("uSTimeMidnightEnd error");
				}

				l_midnight = timeUtil.toLocalTime(midnight);
				LocalTime l_uEnd = timeUtil.toLocalTime(uEnd);

				uSec = (int) l_midnight.until(l_uEnd, ChronoUnit.SECONDS);
				vo.setuSec(uSec);
				vo.setNickName(nickName);

				realStudyUSec = timeUtil.realUSec(uSec, studyMin, restMin).getRealStudyUSec();
				realRestUSec = timeUtil.realUSec(uSec, studyMin, restMin).getRealRestUSec();
				vo.setRealStudyUSec(realStudyUSec);
				vo.setRealRestUSec(realRestUSec);

				cnt = dao.uSTimeSecUpdate(vo);
				if (cnt <= 0) {
					throw new ServletException("uSTimeSecUpdate error");
				}
			}

		}

		return "timeSetSelect.do";
	}

}
