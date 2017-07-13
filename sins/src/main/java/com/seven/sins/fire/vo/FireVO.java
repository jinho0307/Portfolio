package com.seven.sins.fire.vo;

@SuppressWarnings("serial")
public class FireVO implements java.io.Serializable{
	private String classify;
	private int fireNo;
	private String fireById;
	private String fireId;
	private int lev;
	private int commentNo;
	private int co;
	
	public FireVO() {}
	
	public FireVO(String classify, int fireNo, String fireById, String fireId, int lev, int commentNo, int co) {
		this.classify = classify;
		this.fireNo = fireNo;
		this.fireById = fireById;
		this.fireId = fireId;
		this.lev = lev;
		this.commentNo = commentNo;
		this.co = co;
	}
	
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public int getFireNo() {
		return fireNo;
	}
	public void setFireNo(int fireNo) {
		this.fireNo = fireNo;
	}
	public String getFireById() {
		return fireById;
	}
	public void setFireById(String fireById) {
		this.fireById = fireById;
	}
	public String getFireId() {
		return fireId;
	}
	public void setFireId(String fireId) {
		this.fireId = fireId;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	
	public int getCo() {
		return co;
	}

	public void setCo(int co) {
		this.co = co;
	}

	@Override
	public String toString() {
		return "FireVO [classify=" + classify + ", fireNo=" + fireNo + ", fireById=" + fireById + ", fireId=" + fireId
				+ ", lev=" + lev + ", commentNo=" + commentNo + ", co=" + co +"]";
	}

	
	
	
}
