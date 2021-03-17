package kr.valkyrie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class WSTimeDAO {
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

	public String sWeekSelect(String dDay) {
		getConnect();
		String SQL = "select to_char(NEXT_DAY(to_date(?),'老夸老') - 7, 'yyyy-mm-dd') as sWeek from dual";
		String sWeek = "";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, dDay);
		rs = ps.executeQuery();
		if (rs.next()) {
			sWeek = rs.getString("sWeek");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return sWeek;
	}
	
	public String eWeekSelect(String dDay) {
		getConnect();
		String SQL = "select to_char(NEXT_DAY(to_date(?),'老夸老') - 1, 'yyyy-mm-dd') as eWeek from dual";
		String eWeek = "";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, dDay);
		rs = ps.executeQuery();
		if (rs.next()) {
			eWeek = rs.getString("eWeek");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return eWeek;
	}

	public WSTimeVO WSecSelect(String nickName, String sWeek) {
		getConnect();
		WSTimeVO vo = new WSTimeVO();
		String SQL = "select wSec, restWSec from wSTime where sWeek = ? and nickName = ?";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, sWeek);
		ps.setString(2, nickName);
		rs = ps.executeQuery();
		if (rs.next()) {
			int wSec = rs.getInt("wSec");
			int restWSec = rs.getInt("restWSec");
			vo.setwSec(wSec);
			vo.setRestWSec(restWSec);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return vo;
	}

	public ArrayList<WSTimeVO> wSTimeRanking(String sWeek, String ctgry) {
		getConnect();
		ArrayList<WSTimeVO> list = new ArrayList<WSTimeVO>();
		String SQL = "select * from (  " + 
				"select rank() over (order by wSec desc) as rank, w.nickName, w.wSec, w.sWeek, w.eWeek " + 
				"from wSTime w, member m " + 
				"where w.nickName = m.nickName "
				+ " and w.sWeek = ? and m.ctgry = ? " + 
				"order by w.wSec desc " + 
				") " + 
				"where rownum <= 26";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, sWeek);
		ps.setString(2, ctgry);
		rs = ps.executeQuery();
		while (rs.next()) {
			int rank = rs.getInt("rank");
			String nickName = rs.getString("nickName");
			int wSec = rs.getInt("wSec");
			String eWeek = rs.getString("eWeek");
			WSTimeVO vo = new WSTimeVO();
			vo.setRank(rank);
			vo.setNickName(nickName);
			vo.setwSec(wSec);
			vo.setsWeek(sWeek);
			vo.seteWeek(eWeek);
			list.add(vo);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return list;
	}

	public String previousSWeek(String sWeek) {
		getConnect();
		String SQL = "select to_char(to_date(?)-7, 'yyyy-mm-dd') as previousSWeek from dual";
		String previousSWeek = "";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, sWeek);
		rs = ps.executeQuery();
		if (rs.next()) {
			previousSWeek = rs.getString("previousSWeek");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return previousSWeek;
	}

	public String nextSWeek(String sWeek) {
		getConnect();
		String SQL = "select to_char(to_date(?)+7, 'yyyy-mm-dd') as nextSWeek from dual";
		String nextSWeek = "";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setString(1, sWeek);
		rs = ps.executeQuery();
		if (rs.next()) {
			nextSWeek = rs.getString("nextSWeek");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return nextSWeek;
	}

}
