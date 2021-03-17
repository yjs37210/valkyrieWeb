package kr.valkyrie.model;

public class DSTimeVO {

	private int dNum;
	private String nickName;
	private String dDay;
	private int dSec; 
	private String dTime;
	
	// start, end
	private String studyStart;
	private String studyEnd;
	
	// rank
	private int rank;
	
	// real
	private int restDSec;
	private String restDTime;
	
	public DSTimeVO() {
		super();
	}
	
	public DSTimeVO(int rank, String nickName, String dTime) {
		super();
		this.rank = rank;
		this.nickName = nickName;
		this.dTime = dTime;
	}
	

	public DSTimeVO(String dDay, int dSec, String dTime) {
		super();
		this.dDay = dDay;
		this.dSec = dSec;
		this.dTime = dTime;
	}

	public DSTimeVO(int rank, String dDay, String nickName, String dTime) {
		super();
		this.nickName = nickName;
		this.dDay = dDay;
		this.dTime = dTime;
		this.rank = rank;
	}

	public DSTimeVO(String nickName, String dDay, int dSec, String dTime) {
		super();
		this.nickName = nickName;
		this.dDay = dDay;
		this.dSec = dSec;
		this.dTime = dTime;
	}
	public DSTimeVO(int dNum, String nickName, String dDay, int dSec, String dTime) {
		super();
		this.dNum = dNum;
		this.nickName = nickName;
		this.dDay = dDay;
		this.dSec = dSec;
		this.dTime = dTime;
	}
	public int getdNum() {
		return dNum;
	}
	public void setdNum(int dNum) {
		this.dNum = dNum;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getdDay() {
		return dDay;
	}
	public void setdDay(String dDay) {
		this.dDay = dDay;
	}
	public int getdSec() {
		return dSec;
	}
	public void setdSec(int dSec) {
		this.dSec = dSec;
	}
	public String getdTime() {
		return dTime;
	}
	public void setdTime(String dTime) {
		this.dTime = dTime;
	}
	
	public String getStudyStart() {
		return studyStart;
	}
	public void setStudyStart(String studyStart) {
		this.studyStart = studyStart;
	}
	public String getStudyEnd() {
		return studyEnd;
	}
	public void setStudyEnd(String studyEnd) {
		this.studyEnd = studyEnd;
	}
	
	
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getRestDSec() {
		return restDSec;
	}
	public void setRestDSec(int restDSec) {
		this.restDSec = restDSec;
	}
	
	
	public String getRestDTime() {
		return restDTime;
	}
	public void setRestDTime(String restDTime) {
		this.restDTime = restDTime;
	}
	@Override
	public String toString() {
		return "DSTimeVO [dNum=" + dNum + ", nickName=" + nickName + ", dDay=" + dDay + ", dSec=" + dSec + ", dTime="
				+ dTime + ", studyStart=" + studyStart + ", studyEnd=" + studyEnd + ", rank=" + rank + ", restDSec="
				+ restDSec + ", restDTime=" + restDTime + "]";
	}
	
	
	
	
}
