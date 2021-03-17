package kr.valkyrie.model;

public class MSTimeVO {
	private int mNum;
	private String nickName;
	private String month;
	private int lastDay;
	private int mSec;
	private String mTime;
	private String avgMTime;
	private int restMSec;
	private String restMTime;
	
	// rank
	private int rank;
	
	public MSTimeVO() {
		super();
	}
	
	public MSTimeVO(String nickName, String mTime, int rank) {
		super();
		this.nickName = nickName;
		this.mTime = mTime;
		this.rank = rank;
	}

	public MSTimeVO(String nickName, String month, String mTime, int rank) {
		super();
		this.nickName = nickName;
		this.month = month;
		this.mTime = mTime;
		this.rank = rank;
	}



	public MSTimeVO(String nickName, String month, int lastDay, int mSec, String mTime, String avgMTime) {
		super();
		this.nickName = nickName;
		this.month = month;
		this.lastDay = lastDay;
		this.mSec = mSec;
		this.mTime = mTime;
		this.avgMTime = avgMTime;
	}



	public MSTimeVO(int mNum, String nickName, String month, int lastDay, int mSec, String mTime, String avgMTime) {
		super();
		this.mNum = mNum;
		this.nickName = nickName;
		this.month = month;
		this.lastDay = lastDay;
		this.mSec = mSec;
		this.mTime = mTime;
		this.avgMTime = avgMTime;
	}



	public int getmNum() {
		return mNum;
	}

	public void setmNum(int mNum) {
		this.mNum = mNum;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getLastDay() {
		return lastDay;
	}

	public void setLastDay(int lastDay) {
		this.lastDay = lastDay;
	}

	public int getmSec() {
		return mSec;
	}

	public void setmSec(int mSec) {
		this.mSec = mSec;
	}

	public String getmTime() {
		return mTime;
	}

	public void setmTime(String mTime) {
		this.mTime = mTime;
	}

	public String getAvgMTime() {
		return avgMTime;
	}

	public void setAvgMTime(String avgMTime) {
		this.avgMTime = avgMTime;
	}
	

	public int getRank() {
		return rank;
	}



	public void setRank(int rank) {
		this.rank = rank;
	}



	public int getRestMSec() {
		return restMSec;
	}



	public void setRestMSec(int restMSec) {
		this.restMSec = restMSec;
	}



	public String getRestMTime() {
		return restMTime;
	}



	public void setRestMTime(String restMTime) {
		this.restMTime = restMTime;
	}



	@Override
	public String toString() {
		return "MSTimeVO [mNum=" + mNum + ", nickName=" + nickName + ", month=" + month + ", lastDay=" + lastDay
				+ ", mSec=" + mSec + ", mTime=" + mTime + ", avgMTime=" + avgMTime + "]";
	}
	
	
	
}
