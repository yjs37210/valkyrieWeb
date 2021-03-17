package kr.valkyrie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DSTimeDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	private void getConnect() {
		String URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String user = "hr";
		String password = "hr";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(URL, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void dbClose() {
		try {
			if (rs != null)
				rs.close();
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String now() {
		getConnect();
		String dDay = "";
		String SQL = "select to_char(sysdate, 'yyyy-MM-dd') as dDay from dual";
		try {
		ps = conn.prepareStatement(SQL);
		rs = ps.executeQuery();
		if (rs.next()) {
			dDay = rs.getString("dDay");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return dDay;
	}
	
	public DSTimeVO dSecSelect(String nickName, String dDay) {
		getConnect();
		String SQL = "select dSec, restDSec from dSTime where nickName = ? and dDay = ?";
		DSTimeVO vo = new DSTimeVO();
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, nickName);
		ps.setString(2, dDay);
		rs = ps.executeQuery();
		if (rs.next()) {
			int dSec = rs.getInt("dSec");
			int restDSec = rs.getInt("restDSec");
			vo.setNickName(nickName);
			vo.setdDay(dDay);
			vo.setdSec(dSec);
			vo.setRestDSec(restDSec);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return vo;
	}
	
	public String studyStartSelect(DSTimeVO vo) {
		getConnect();
		String studyStart = "";
		String SQL = "select uStart from uSTime where nickName = ? and to_char(uStart, 'yyyy-MM-dd') = ? "
				+ "order by uStart";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, vo.getNickName());
		ps.setString(2, vo.getdDay());
		rs = ps.executeQuery();
		if (rs.next()) {
			studyStart = rs.getString("uStart");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return studyStart;
	}

	public String studyEndSelect(DSTimeVO vo) {
		getConnect();
		String studyEnd = "";
		String SQL = "select uEnd from uSTime where nickName = ? and to_char(uStart, 'yyyy-MM-dd') = ? "
				+ "order by uStart desc";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, vo.getNickName());
		ps.setString(2, vo.getdDay());
		rs = ps.executeQuery();
		if (rs.next()) {
			studyEnd = rs.getString("uEnd");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return studyEnd;
	}

	public ArrayList<String> weeklyDay(String sWeek) {
		getConnect();
		ArrayList<String> weeklyDays = new ArrayList<String>();
		String SQL = "SELECT TO_CHAR( TO_DATE(?) + ROWNUM-1, 'YYYY-MM-DD') AS DAY " + 
				"FROM DUAL " + 
				"CONNECT BY level <= ROUND( TO_DATE(?)+7 - TO_DATE(?) ) ";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, sWeek);
		ps.setString(2, sWeek);
		ps.setString(3, sWeek);
		rs = ps.executeQuery();
		while (rs.next()) {
			String day = rs.getString("day");
			weeklyDays.add(day);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return weeklyDays;
	}

	public ArrayList<DSTimeVO> dSTimeWeeklySelect(String sWeek, String nickName) {
		getConnect();
		ArrayList<DSTimeVO> list = new ArrayList<DSTimeVO>();
		String SQL = "select dDay, dSec from dSTime where nickName = ? "
				+ "and to_date(dDay) between to_date(?) and to_date(?)+7";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, nickName);
		ps.setString(2, sWeek);
		ps.setString(3, sWeek);
		rs = ps.executeQuery();
		while (rs.next()) {
			String dDay = rs.getString("dDay");
			int dSec = rs.getInt("dSec");
			DSTimeVO vo = new DSTimeVO();
			vo.setdDay(dDay);
			vo.setdSec(dSec);
			list.add(vo);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return list;
	}

	public ArrayList<String> monthlyDay(String month, String nickName) {
		getConnect();
		ArrayList<String> monthlyDays = new ArrayList<String>();
		String SQL = "SELECT TO_CHAR( TO_DATE(?) + ROWNUM-1, 'YYYY-MM-DD') AS DAY " + 
				"FROM DUAL " + 
				"CONNECT BY level <= ROUND( last_day(TO_DATE(?))+1 - TO_DATE(?) ) ";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, month);
		ps.setString(2, month);
		ps.setString(3, month);
		rs = ps.executeQuery();
		while (rs.next()) {
			String day = rs.getString("day");
			monthlyDays.add(day);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return monthlyDays;
	}

	public ArrayList<DSTimeVO> dSTimeMonthlySelect(String month, String nickName) {
		getConnect();
		ArrayList<DSTimeVO> list = new ArrayList<DSTimeVO>();
		String SQL = "select dDay, dSec from dSTime where nickName = ? "
				+ "and to_date(dDay) between to_date(?) and last_day(to_date(?))+1";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, nickName);
		ps.setString(2, month);
		ps.setString(3, month);
		rs = ps.executeQuery();
		while (rs.next()) {
			String dDay = rs.getString("dDay");
			int dSec = rs.getInt("dSec");
			DSTimeVO vo = new DSTimeVO();
			vo.setdDay(dDay);
			vo.setdSec(dSec);
			list.add(vo);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return list;
	}

	public ArrayList<DSTimeVO> dSTimeRanking(String yesterDay, String ctgry) {
		getConnect();
		ArrayList<DSTimeVO> list = new ArrayList<DSTimeVO>();
		String SQL = "select * from ( " + 
				"select rank() over (order by dSec desc) as rank, d.nickName, d.dSec, d.dDay " + 
				"from dSTime d, member m " + 
				"where d.nickName = m.nickName "
				+ "and d.dDay = ? and m.ctgry = ? " + 
				"order by d.dSec desc " + 
				") " + 
				"where rownum <= 26";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, yesterDay);
		ps.setString(2, ctgry);
		rs = ps.executeQuery();
		while (rs.next()) {
			int rank = rs.getInt("rank");
			String nickName = rs.getString("nickName");
			int dSec = rs.getInt("dSec");
			String dDay = rs.getString("dDay");
			DSTimeVO vo = new DSTimeVO();
			vo.setRank(rank);
			vo.setNickName(nickName);
			vo.setdSec(dSec);
			vo.setdDay(dDay);
			list.add(vo);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return list;
	}

	public String yesterDay(String dDay) {
		getConnect();
		String yesterDay = "";
		String SQL = "select to_char(to_date(?)-1, 'yyyy-MM-dd') as yesterDay from dual";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, dDay);
		rs = ps.executeQuery();
		if (rs.next()) {
			yesterDay = rs.getString("yesterDay");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return yesterDay;
	}

	public String tomorrow(String dDay) {
		getConnect();
		String tomorrow = "";
		String SQL = "select to_char(to_date(?)+1, 'yyyy-MM-dd') as tomorrow from dual";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, dDay);
		rs = ps.executeQuery();
		if (rs.next()) {
			tomorrow = rs.getString("tomorrow");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return tomorrow;
	}


	
	

	
	
}
