package kr.valkyrie.model;

public class MemberVO {

	private int code;
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String gender;
	private String tel; 
	private String email;
	private String addr;
	private String ctgry;
	private int admin;
	
	// 카테고리 개수
	private int ctgryNum;
	
	public MemberVO() {
		super();
	}
	public MemberVO(String id, String pw, String name, String nickName, String gender, String tel, String email,
			String addr, String ctgry) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickName = nickName;
		this.gender = gender;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.ctgry = ctgry;
	}
	public MemberVO(String id, String pw, String name, String nickName, String gender, String tel, String email,
			String addr, String ctgry, int admin) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickName = nickName;
		this.gender = gender;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.ctgry = ctgry;
		this.admin = admin;
	}
	public MemberVO(int code, String id, String pw, String name, String nickName, String gender, String tel,
			String email, String addr, String ctgry, int admin, int ctgryNum) {
		super();
		this.code = code;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickName = nickName;
		this.gender = gender;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.ctgry = ctgry;
		this.admin = admin;
		this.ctgryNum = ctgryNum;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCtgry() {
		return ctgry;
	}
	public void setCtgry(String ctgry) {
		this.ctgry = ctgry;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	
	public int getCtgryNum() {
		return ctgryNum;
	}

	public void setCtgryNum(int ctgryNum) {
		this.ctgryNum = ctgryNum;
	}
	@Override
	public String toString() {
		return "MemberVO [code=" + code + ", id=" + id + ", pw=" + pw + ", name=" + name + ", nickName=" + nickName
				+ ", gender=" + gender + ", tel=" + tel + ", email=" + email + ", addr=" + addr + ", ctgry=" + ctgry
				+ ", admin=" + admin + ", ctgryNum=" + ctgryNum + "]";
	}

	
}
