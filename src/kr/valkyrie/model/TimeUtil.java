package kr.valkyrie.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class TimeUtil {

	// String형 yyyy-mm-ss hh:mm:ss 를 LocalTime형으로 변환해주는 메소드
	public LocalTime toLocalTime(String dateAndTime) {

		return LocalTime.of(Integer.parseInt(dateAndTime.substring(11, 13)),
				Integer.parseInt(dateAndTime.substring(14, 16)), Integer.parseInt(dateAndTime.substring(17, 19)));

	}

	// 초(sec)를 String형 hh:mm:ss로 변환해주는 메소드
	public String secToTime(int sec) {
		String time = "";
		if((sec/3600) < 10) {
			time += "0";
		}
		time += Integer.toString((sec/3600));
		time += ":";
		if((sec/60)%60 < 10) {
			time += "0";
		}
		time += Integer.toString((sec/60)%60);
		time += ":";
		if(sec%60 < 10) {
			time += "0";
		}
		time += Integer.toString(sec%60);
		return time;
	}

	public LocalDate toLocalDate(String date) {
		return LocalDate.of(Integer.parseInt(date.substring(0, 4)),
				Integer.parseInt(date.substring(5, 7)), Integer.parseInt(date.substring(8, 10)));
	}
	
//	public DSTimeVO realDSec(int dSec, int studyMin, int restMin) {
//		DSTimeVO vo = new DSTimeVO();
//		int sum = studyMin*60 + restMin*60;
//		System.out.println("sum : "+sum);
//		int num = dSec / sum;
//		System.out.println("num : "+num);
//		int realStudyDSec = 0;
//		int realRestDSec = 0;
//		if(dSec % sum < studyMin*60) {
//			realStudyDSec = studyMin*60 * num + dSec % sum;
//			realRestDSec = restMin*60 * num;
//		}else {
//			realStudyDSec = studyMin*60 * (num + 1);
//			realRestDSec = restMin*60 * num + dSec % sum - studyMin*60;
//		}
//		vo.setRealStudyDSec(realStudyDSec);
//		vo.setRealRestDSec(realRestDSec);
//		return vo;
//	}
	
	public USTimeVO realUSec(int uSec, int studyMin, int restMin) {
		USTimeVO vo = new USTimeVO();
		int sum = studyMin*60 + restMin*60;
		int num = uSec / sum;
		int realStudyUSec = 0;
		int realRestUSec = 0;
		if(uSec % sum < studyMin*60) {
			realStudyUSec = studyMin*60 * num + uSec % sum;
			realRestUSec = restMin*60 * num;
		}else {
			realStudyUSec = studyMin*60 * (num + 1);
			realRestUSec = restMin*60 * num + uSec % sum - studyMin*60;
		}
		vo.setRealStudyUSec(realStudyUSec);
		vo.setRealRestUSec(realRestUSec);
		return vo;
	}


}
