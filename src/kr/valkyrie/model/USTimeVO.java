package kr.valkyrie.model;

public class USTimeVO {
	private int uNum;
	private String nickName;
	private String uStart;
	private String uEnd;
	private int uSec;
	
	private int realStudyUSec;
	private int realRestUSec;
	
	public USTimeVO() {
		super();
	}
	
	public USTimeVO(int uNum, String nickName, String uStart, String uEnd) {
		super();
		this.uNum = uNum;
		this.nickName = nickName;
		this.uStart = uStart;
		this.uEnd = uEnd;
	}

	public USTimeVO(String nickName, String uStart, String uEnd, int uSec) {
		super();
		this.nickName = nickName;
		this.uStart = uStart;
		this.uEnd = uEnd;
		this.uSec = uSec;
	}
	public USTimeVO(int uNum, String nickName, String uStart, String uEnd, int uSec) {
		super();
		this.uNum = uNum;
		this.nickName = nickName;
		this.uStart = uStart;
		this.uEnd = uEnd;
		this.uSec = uSec;
	}
	public int getuNum() {
		return uNum;
	}
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getuStart() {
		return uStart;
	}
	public void setuStart(String uStart) {
		this.uStart = uStart;
	}
	public String getuEnd() {
		return uEnd;
	}
	public void setuEnd(String uEnd) {
		this.uEnd = uEnd;
	}
	public int getuSec() {
		return uSec;
	}
	public void setuSec(int uSec) {
		this.uSec = uSec;
	}
	
	public int getRealStudyUSec() {
		return realStudyUSec;
	}

	public void setRealStudyUSec(int realStudyUSec) {
		this.realStudyUSec = realStudyUSec;
	}

	public int getRealRestUSec() {
		return realRestUSec;
	}

	public void setRealRestUSec(int realRestUSec) {
		this.realRestUSec = realRestUSec;
	}

	@Override
	public String toString() {
		return "USTimeVO [uNum=" + uNum + ", nickName=" + nickName + ", uStart=" + uStart + ", uEnd=" + uEnd + ", uSec="
				+ uSec + ", realStudyUSec=" + realStudyUSec + ", realRestUSec=" + realRestUSec + "]";
	}

	
	
	
	
}
