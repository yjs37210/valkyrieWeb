package kr.valkyrie.model;

public class WSTimeVO {
	
	private int wNum;
	private String nickName;
	private String sWeek;
	private String eWeek;
	private int wSec;
	private String wTime;
	private String avgWTime;
	private int restWSec;
	private String restWTime;
	
	//rank
	private int rank;
	
	public WSTimeVO() {
		super();
	}
	
	public WSTimeVO(String nickName, String wTime, int rank) {
		super();
		this.nickName = nickName;
		this.wTime = wTime;
		this.rank = rank;
	}

	public WSTimeVO(String nickName, String sWeek, String eWeek, int wSec, String wTime, String avgWTime) {
		super();
		this.nickName = nickName;
		this.sWeek = sWeek;
		this.eWeek = eWeek;
		this.wSec = wSec;
		this.wTime = wTime;
		this.avgWTime = avgWTime;
	}
	public WSTimeVO(int wNum, String nickName, String sWeek, String eWeek, int wSec, String wTime, String avgWTime) {
		super();
		this.wNum = wNum;
		this.nickName = nickName;
		this.sWeek = sWeek;
		this.eWeek = eWeek;
		this.wSec = wSec;
		this.wTime = wTime;
		this.avgWTime = avgWTime;
	}
	public int getwNum() {
		return wNum;
	}
	public void setwNum(int wNum) {
		this.wNum = wNum;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getsWeek() {
		return sWeek;
	}
	public void setsWeek(String sWeek) {
		this.sWeek = sWeek;
	}
	public String geteWeek() {
		return eWeek;
	}
	public void seteWeek(String eWeek) {
		this.eWeek = eWeek;
	}
	public int getwSec() {
		return wSec;
	}
	public void setwSec(int wSec) {
		this.wSec = wSec;
	}
	public String getwTime() {
		return wTime;
	}
	public void setwTime(String wTime) {
		this.wTime = wTime;
	}
	public String getAvgWTime() {
		return avgWTime;
	}
	public void setAvgWTime(String avgWTime) {
		this.avgWTime = avgWTime;
	}
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
	public int getRestWSec() {
		return restWSec;
	}
	public void setRestWSec(int restWSec) {
		this.restWSec = restWSec;
	}
	
	public String getRestWTime() {
		return restWTime;
	}
	public void setRestWTime(String restWTime) {
		this.restWTime = restWTime;
	}
	@Override
	public String toString() {
		return "WSTimeVO [wNum=" + wNum + ", nickName=" + nickName + ", sWeek=" + sWeek + ", eWeek=" + eWeek + ", wSec="
				+ wSec + ", wTime=" + wTime + ", avgWTime=" + avgWTime + "]";
	}
	
	
	
}
