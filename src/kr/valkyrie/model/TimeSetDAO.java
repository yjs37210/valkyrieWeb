package kr.valkyrie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TimeSetDAO {

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
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(conn!=null) conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public TimeSetVO timeSetSelect(String nickName) {
		getConnect();
		String SQL = "select studyMin, restMin from timeSet where nickName = ?";
		TimeSetVO vo = null;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, nickName);
			rs = ps.executeQuery();
			if(rs.next()) {
				int studyMin = rs.getInt("studyMin");
				int restMin = rs.getInt("restMin");
				vo = new TimeSetVO(nickName, studyMin, restMin);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return vo; 
	}

	public boolean TimeSetCheck(String nickName) {
		getConnect();
		String SQL = "select studyMin from timeSet where nickName = ? and studyMin is null";
		boolean check = false;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, nickName);
			rs = ps.executeQuery();
			if(rs.next()) {
				check = !check;
				System.out.println(check);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return true;
	}

	public int timeSetUpadate(TimeSetVO vo) {
		int cnt = -1;
		getConnect();
		String SQL = "update timeSet set studyMin = ?, restMin = ? where nickName = ?";
		try {
		ps = conn.prepareStatement(SQL);
		ps.setInt(1, vo.getStudyMin());
		ps.setInt(2, vo.getRestMin());
		ps.setString(3, vo.getNickName());
		cnt = ps.executeUpdate(); 
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
		return cnt;
	}

}
