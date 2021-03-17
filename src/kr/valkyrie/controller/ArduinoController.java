package kr.valkyrie.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.valkyrie.model.MemberDAO;
import kr.valkyrie.model.StudyStatusDAO;
import kr.valkyrie.model.TimeSetDAO;
import kr.valkyrie.model.TimeSetVO;
import kr.valkyrie.model.USTimeDAO;

public class ArduinoController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String statusCheck = request.getParameter("statusCheck");
		String btnStatus = statusCheck.substring(0, 1);
		String id = statusCheck.substring(1);
		MemberDAO mdao = new MemberDAO();
		String nickName = mdao.memberNickNameSelect(id);

		StudyStatusDAO dao = new StudyStatusDAO();
		int status = dao.statusSelect(id);
		TimeSetDAO timeSetDao = new TimeSetDAO();
		TimeSetVO vo = timeSetDao.timeSetSelect(nickName);
		String statusJson = "";

		if (btnStatus.equals("x")) {
			if (status == 0) {
				statusJson = "/{\"a\":0}/";
			} else if (status == 1) {
				statusJson = "/{\"a\":1,\"b\":" + id + ", \"c\":" + vo.getStudyMin() + ", \"d\":"
						+ vo.getRestMin() + "}/";
			}
		} else if (btnStatus.equals("0")) {
			USTimeDAO uSTimedao = new USTimeDAO();
			if (status == 0) {
				dao.statusUpdateTo1(id);
				uSTimedao.uSTimeStartInsert(nickName);
				statusJson = "/{\"a\":1,\"b\":" + id + ", \"c\":" + vo.getStudyMin() + ", \"d\":"
						+ vo.getRestMin() + "}/";
			}else if (status == 1) {
				dao.statusUpdateTo0(id);
				uSTimedao.uSTimeEndUpdate(nickName);
				statusJson = "/{\"a\":0}/";
			}
		}

		return statusJson;
	}

}
