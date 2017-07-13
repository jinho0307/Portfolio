package com.seven.sins.group.vo;

@SuppressWarnings("serial")
public class GroupLikeVO implements java.io.Serializable {

	private int writeNo;
	private String userId;
	private String classify;
	private int groupNo;

	public GroupLikeVO() {
		// TODO Auto-generated constructor stub
	}

	public GroupLikeVO(int writeNo, String userId, String classify, int groupNo) {
		super();
		this.writeNo = writeNo;
		this.userId = userId;
		this.classify = classify;
		this.groupNo = groupNo;
	}

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	@Override
	public String toString() {
		return "GroupLikeVO [writeNo=" + writeNo + ", userId=" + userId + ", classify=" + classify + ", groupNo="
				+ groupNo + "]";
	}
}