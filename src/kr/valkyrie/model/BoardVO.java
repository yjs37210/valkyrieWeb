package kr.valkyrie.model;

public class BoardVO {
	
	private int bNum;
	private String bPw;
	private String nickName;
	private String bEmail;
	private String title;
	private String content;
	private String writeDate;
	private String a_content;
	private String a_check;

	public BoardVO() {
		super();
	}
	
	public BoardVO(int bNum, String a_content) {
		super();
		this.bNum = bNum;
		this.a_content = a_content;
	}

	public BoardVO(String bPw, String nickName, String bEmail, String title, String content) {
		super();
		this.bPw = bPw;
		this.nickName = nickName;
		this.bEmail = bEmail;
		this.title = title;
		this.content = content;
	}

	public BoardVO(int bNum, String nickName, String title, String writeDate, String a_check) {
		super();
		this.bNum = bNum;
		this.nickName = nickName;
		this.title = title;
		this.writeDate = writeDate;
		this.a_check = a_check;
	}

	public BoardVO(int bNum, String bPw, String nickName, String bEmail, String title, String content, 
			String writeDate) {
		super();
		this.bNum = bNum;
		this.bPw = bPw;
		this.nickName = nickName;
		this.bEmail = bEmail;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
	}

	
	public BoardVO(String bPw, String nickName, String bEmail, String title, String content, 
			String writeDate, String a_content, String a_check) {
		super();
		this.bPw = bPw;
		this.nickName = nickName;
		this.bEmail = bEmail;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.a_content = a_content;
		this.a_check = a_check;
	}

	public BoardVO(int bNum, String bPw, String nickName, String bEmail, String title, String content, 
			String writeDate, String a_content, String a_check) {
		super();
		this.bNum = bNum;
		this.bPw = bPw;
		this.nickName = nickName;
		this.bEmail = bEmail;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.a_content = a_content;
		this.a_check = a_check;
	}

	public String getA_content() {
		return a_content;
	}

	public void setA_content(String a_content) {
		this.a_content = a_content;
	}

	public String getA_check() {
		return a_check;
	}

	public void setA_check(String a_check) {
		this.a_check = a_check;
	}

	public int getbNum() {
		return bNum;
	}

	public void setbNum(int bNum) {
		this.bNum = bNum;
	}

	public String getbPw() {
		return bPw;
	}

	public void setbPw(String bPw) {
		this.bPw = bPw;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getbEmail() {
		return bEmail;
	}

	public void setbEmail(String bEmail) {
		this.bEmail = bEmail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	
	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "BoardVO [bNum=" + bNum + ", bPw=" + bPw + ", nickName=" + nickName + ", bEmail=" + bEmail + ", title="
				+ title + ", content=" + content + ", writeDate=" + writeDate
				+ ", a_content=" + a_content + ", a_check=" + a_check + "]";
	}


	
	
	

}
