package kr.valkyrie.model;

public class StudyStatusVO {

	private String id;
	private int status;
	
	public StudyStatusVO(String id, int status) {
		super();
		this.id = id;
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "studyStatusVO [id=" + id + ", status=" + status + "]";
	}
	
}
