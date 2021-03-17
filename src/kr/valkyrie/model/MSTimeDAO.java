package kr.valkyrie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MSTimeDAO {
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


	public String lastDaySelect(String firstDay) {

		getConnect();
		String lastDay = "";
		String SQL = "select last_Day(to_date(?)) as lastDay from dual";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, firstDay);
		rs = ps.executeQuery();
		if (rs.next()) {
			lastDay = rs.getString("lastDay");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return lastDay;
	
	}
	
	public String monthSelect(String dDay) {
		getConnect();
		String month = "";
		String SQL = "select to_char(sysdate, 'yyyy-MM') as month from dual ";
		try {
		ps = conn.prepareStatement(SQL);
		rs = ps.executeQuery();
		if (rs.next()) {
			month = rs.getString("month");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return month;
	}

	public String lastDaySelect() {
		getConnect();
		String lastDay = "";
		String SQL = "select last_day(sysdate) as lastDay from dual";
		try {
		ps = conn.prepareStatement(SQL);
		rs = ps.executeQuery();
		if (rs.next()) {
			lastDay = rs.getString("lastDay");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return lastDay;
	}

	public MSTimeVO mTimeSelect(String nickName, String month) {
		getConnect();
		MSTimeVO vo = new MSTimeVO();
		String SQL = "select mSec, restMSec from mSTime where month = ? and nickName = ?";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, month);
		ps.setString(2, nickName);
		rs = ps.executeQuery();
		if (rs.next()) {
			int restMSec = rs.getInt("restMSec");
			int mSec = rs.getInt("mSec");
			vo.setmSec(mSec);
			vo.setRestMSec(restMSec);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return vo;
		
	}

	public ArrayList<MSTimeVO> mSTimeRanking(String month, String ctgry) {
		getConnect();
		ArrayList<MSTimeVO> list = new ArrayList<MSTimeVO>();
		String SQL = "select * from ( " + 
				"select rank() over (order by mSec desc) as rank, t.nickName, t.mSec " + 
				"from mSTime t, member m " + 
				"where t.nickName = m.nickName "
				+ " and t.month = ? and m.ctgry = ? " + 
				"order by t.mSec desc " + 
				") " + 
				"where rownum <= 26";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, month);
		ps.setString(2, ctgry);
		rs = ps.executeQuery();
		while (rs.next()) {
			int rank = rs.getInt("rank");
			String nickName = rs.getString("nickName");
			int mSec = rs.getInt("mSec");
			MSTimeVO vo = new MSTimeVO();
			vo.setRank(rank);
			vo.setNickName(nickName);
			vo.setmSec(mSec);
			vo.setMonth(month);
			list.add(vo);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return list;
	}

	public String previousMonth(String month) {
		getConnect();
		String SQL = "select to_char(to_date(?)-10, 'yyyy-mm') as previousMonth from dual";
		String previousMonth = "";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, month);
		rs = ps.executeQuery();
		if (rs.next()) {
			previousMonth = rs.getString("previousMonth");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return previousMonth;
	}

	public String nextMonth(String month) {
		getConnect();
		String SQL = "select to_char(to_date(?)+10, 'yyyy-mm') as nextMonth from dual";
		String nextMonth = "";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, month);
		rs = ps.executeQuery();
		if (rs.next()) {
			nextMonth = rs.getString("nextMonth");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return nextMonth;
	}


	
	
}
