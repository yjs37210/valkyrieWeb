package kr.valkyrie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberDAO {
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
	public int memberInsert(MemberVO vo) {
		int cnt = -1;
		try {
			getConnect();
			String SQL = "insert into member(code, id, pw, name, nickName, gender, tel, email, addr, ctgry, admin) "
					+ "values (to_char(sysdate,'yyyy')||substr(to_char(code_seq.nextval,'000'),2),?,?,?,?,?,?,?,?,?,0)";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, vo.getId());
			ps.setString(2, vo.getPw());
			ps.setString(3, vo.getName());
			ps.setString(4, vo.getNickName());
			ps.setString(5, vo.getGender());
			ps.setString(6, vo.getTel());
			ps.setString(7, vo.getEmail());
			ps.setString(8, vo.getAddr());
			ps.setString(9, vo.getCtgry());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}
	public int memberTimeSetInsert(String nickName) {
		int cnt = -1;
		try {
			getConnect();
			String SQL = "insert into timeset(setNum, nickName, studyMin, restMin) "
					+ "values (setNum_seq.nextval,?,0,0)";
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
	public int memberStudyStatusInsert(String id) {
		int cnt = -1;
		try {
			getConnect();
			String SQL = "insert into studyStatus(id, status) "
					+ "values (?, 0)";
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
	public boolean isLogin(String id, String pw) {
		getConnect();
		String SQL = "select * from member where id = ? and pw = ?";
		boolean succ = false;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			if(rs.next()) {
				succ = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return succ; 
	}
	public MemberVO memberContentId(String id) {
		getConnect();
		String SQL = "select * from member where id = ?";
		MemberVO vo = null;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String nickName = rs.getString("nickName");
				String gender = rs.getString("gender");
				String tel = rs.getString("tel");
				String email = rs.getString("email");
				String addr = rs.getString("addr");
				String ctgry = rs.getString("ctgry");
				int admin = rs.getInt("admin");
				vo = new MemberVO(id, pw, name, nickName, gender, tel, email, addr, ctgry, admin);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return vo; 
	}
	
	public String memberNickNameSelect(String id) {
		getConnect();
		String SQL = "select nickName from member where id = ?";
		String nickName = "";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				nickName = rs.getString("nickName");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return nickName;
	}
	
	public ArrayList<MemberVO> ctgryNumSelect() {
		getConnect();
		String SQL = "select ctgry, count(ctgry) as ctgryNum from member where ctgry != '°ü¸®ÀÚ' group by ctgry order by count(ctgry) desc";
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		try {
			ps = conn.prepareStatement(SQL);
			rs = ps.executeQuery();
			while(rs.next()) {
				String ctgry = rs.getString("ctgry");
				int ctgryNum = rs.getInt("ctgryNum");
				MemberVO vo = new MemberVO();
				vo.setCtgry(ctgry);
				vo.setCtgryNum(ctgryNum);
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return list;
	}
}
