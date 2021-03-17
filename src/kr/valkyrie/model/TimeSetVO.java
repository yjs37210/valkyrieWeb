package kr.valkyrie.model;

public class TimeSetVO {

	private int setNum;
	private String nickName;
	private int studyMin;
	private int restMin;
	
	public TimeSetVO() {
		super();
	}
	public TimeSetVO(String nickName, int studyMin, int restMin) {
		super();
		this.nickName = nickName;
		this.studyMin = studyMin;
		this.restMin = restMin;
	}
	public TimeSetVO(int setNum, String nickName, int studyMin, int restMin) {
		super();
		this.setNum = setNum;
		this.nickName = nickName;
		this.studyMin = studyMin;
		this.restMin = restMin;
	}
	public int getSetNum() {
		return setNum;
	}
	public void setSetNum(int setNum) {
		this.setNum = setNum;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getStudyMin() {
		return studyMin;
	}
	public void setStudyMin(int studyMin) {
		this.studyMin = studyMin;
	}
	public int getRestMin() {
		return restMin;
	}
	public void setRestMin(int restMin) {
		this.restMin = restMin;
	}
	@Override
	public String toString() {
		return "TimeSetVO [setNum=" + setNum + ", nickName=" + nickName + ", studyMin=" + studyMin + ", restMin="
				+ restMin + "]";
	}
	
}
