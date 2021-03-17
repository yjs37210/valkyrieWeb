package kr.valkyrie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class StudyStatusDAO {

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
	
	public int statusSelect(String id) {
		getConnect();
		String SQL = "select status from studyStatus where id = ?";
		int status = 0;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				status = rs.getInt("status");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return status; 
	}

	public int statusUpdateTo0(String id) {

		int cnt = -1;
		getConnect();
		String SQL = "update studyStatus set status = 0 where id = ?";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
		
	}

	public int statusUpdateTo1(String id) {
		int cnt = -1;
		getConnect();
		String SQL = "update studyStatus set status = 1 where id = ?";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

}
