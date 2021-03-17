package kr.valkyrie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class USTimeDAO {
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
	public int uSTimeStartInsert(String nickName) {
		int cnt = -1;
		try {
			getConnect();
			String SQL = "insert into uSTime(uNum, nickName, uStart) " + "values (uNum_seq.nextval, ?, sysdate)";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, nickName);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}
	public int uSTimeEndUpdate(String nickName) {
		int cnt = -1;
		getConnect();
		String SQL = "update uSTime set uEnd = sysdate where nickName = ? and uEnd is null";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, nickName);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}
	
	public ArrayList<USTimeVO> uSTimeSelect(String nickName) {

		getConnect();
		String SQL = "select * from uSTime where uSec is null and uEnd is not null and nickName = ?";
		ArrayList<USTimeVO> list = new ArrayList<USTimeVO>();
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, nickName);
			rs = ps.executeQuery();
			while(rs.next()) {
				int uNum = rs.getInt("uNum");
				String uStart = rs.getString("uStart");
				String uEnd = rs.getString("uEnd");
				USTimeVO vo = new USTimeVO(uNum, nickName, uStart, uEnd);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list; 
	
	}
	
	public int uSTimeSecUpdate(USTimeVO vo) {

		int cnt = -1;
		getConnect();
		String SQL = "update uSTime set uSec = ?, realStudyUSec = ?, realRestUSec = ? where nickName = ? and uStart = to_date(?, 'yyyy-MM-dd hh24:mi:ss')";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, vo.getuSec());
			ps.setInt(2, vo.getRealStudyUSec());
			ps.setInt(3, vo.getRealRestUSec());
			ps.setString(4, vo.getNickName());
			ps.setString(5, vo.getuStart());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}
	
	public int uSTimeMidnightStart(USTimeVO vo) {
		int cnt = -1;
		getConnect();
		String SQL = "update uSTime set uEnd = to_date(?, 'yyyy-MM-dd hh24:mi:ss'), uSec = null where uNum = ?";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, vo.getuEnd());
			ps.setInt(2, vo.getuNum());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public int uSTimeMidnightEnd(USTimeVO vo) {

		int cnt = -1;
		try {
			getConnect();
			String SQL = "insert into uSTime (uNum, nickName, uStart, uEnd) " + "values (uNum_seq.nextval, ?, to_date(?, 'yyyy-MM-dd hh24:mi:ss'), to_date(?, 'yyyy-MM-dd hh24:mi:ss'))";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, vo.getNickName());
			ps.setString(2, vo.getuStart());
			ps.setString(3, vo.getuEnd());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
		
	}

}
