package kr.valkyrie.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
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

	public ArrayList<BoardVO> boardAllList() {
		getConnect();
		String SQL = "select bNum, nickName, title, writeDate, a_check from board order by bNum";
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		try {
		ps = conn.prepareStatement(SQL);
		rs = ps.executeQuery();
		while (rs.next()) {
			int bNum = rs.getInt("bNum");
			String nickName = rs.getString("nickName");
			String title = rs.getString("title");
			String writeDate = rs.getString("writeDate");
			String a_check = rs.getString("a_check");
			BoardVO vo = new BoardVO(bNum, nickName, title, writeDate, a_check);
			list.add(vo);
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		dbClose();
	}
	return list;
	}

	public int boardInsert(BoardVO vo) {
		int cnt = -1;
		try {
			getConnect();
			String SQL = "insert into board(bNum, bPw, nickName, bEmail, title, content, writeDate, a_check) "
					+ "values (bNum_seq.nextval, ?, ?, ?, ?, ?, sysdate, 'X')";
			ps = conn.prepareStatement(SQL);
			ps.setString(1, vo.getbPw());
			ps.setString(2, vo.getNickName());
			ps.setString(3, vo.getbEmail());
			ps.setString(4, vo.getTitle());
			ps.setString(5, vo.getContent());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public BoardVO boardContent(int bNum) {
		getConnect();
		String SQL = "select bPw, nickName, bEmail, writeDate, title, content, a_content, a_check from board where bNum = ?";
		BoardVO vo = null;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, bNum);
			rs = ps.executeQuery();
			if(rs.next()) {
				String bPw = rs.getString("bPw");
				String nickName = rs.getString("nickName");
				String bEmail = rs.getString("bEmail");
				String writeDate = rs.getString("writeDate");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String a_content = rs.getString("a_content");
				String a_check = rs.getString("a_check");
				
				vo = new BoardVO(bNum, bPw, nickName, bEmail, title, content, writeDate, a_content, a_check);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return vo; 
	}

	public int boardDelete(int bNum) {
		
		getConnect();
		String SQL = "delete from board where bNum = ?";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, bNum);
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
		
	}

	public int boardAnswerInsert(BoardVO vo) {
		int cnt = -1;
		getConnect();
		String SQL = "update board set a_content = ?, a_check = 'O' where bNum = ?";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, vo.getA_content());
			ps.setInt(2, vo.getbNum());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

	public String boardBPwSelect(int bNum) {
		getConnect();
		String SQL = "select bPw from board where bNum = ?";
		String bPw = "";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, bNum);
			rs = ps.executeQuery();
			if(rs.next()) {
				bPw = rs.getString("bPw");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			dbClose();
		}
		return bPw; 
	}

	public int boardUpdate(BoardVO vo) {
		int cnt = -1;
		getConnect();
		String SQL = "update board set title = ?, content = ? where bNum = ?";
		try {
			ps = conn.prepareStatement(SQL);
			ps.setString(1, vo.getTitle());
			ps.setString(2, vo.getContent());
			ps.setInt(3, vo.getbNum());
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		return cnt;
	}

}
