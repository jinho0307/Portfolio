package com.seven.sins.group.vo;

@SuppressWarnings("serial")
public class GroupMemberVO implements java.io.Serializable {

	private int groupNo;
	private String userId;
	private String userName;
	private String userProfile;
	private int grade;
	private String classify;
	private String groupAccept;
	
	public GroupMemberVO() {
		// TODO Auto-generated constructor stub
	}

	public GroupMemberVO(int groupNo, String userId, String userName, String userProfile, int grade, String classify,
			String groupAccept) {
		super();
		this.groupNo = groupNo;
		this.userId = userId;
		this.userName = userName;
		this.userProfile = userProfile;
		this.grade = grade;
		this.classify = classify;
		this.groupAccept = groupAccept;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getClassify() {
		return classify;
	}

	public void setClassify(String classify) {
		this.classify = classify;
	}

	public String getGroupAccept() {
		return groupAccept;
	}

	public void setGroupAccept(String groupAccept) {
		this.groupAccept = groupAccept;
	}

	@Override
	public String toString() {
		return "GroupMemberVO [groupNo=" + groupNo + ", userId=" + userId + ", userName=" + userName + ", userProfile="
				+ userProfile + ", grade=" + grade + ", classify=" + classify + ", groupAccept=" + groupAccept + "]";
	}
}