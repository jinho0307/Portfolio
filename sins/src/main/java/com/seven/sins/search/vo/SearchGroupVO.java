package com.seven.sins.search.vo;

@SuppressWarnings("serial")
public class SearchGroupVO implements java.io.Serializable{

	private String groupNo;
	private String groupName;
	private String category;
	private String filePath;
	private int joinNum;
	private String isJoin;
	private String userId;
	private String info;
	
	
	public SearchGroupVO(){}


	public SearchGroupVO(String groupNo, String groupName, String category, String filePath, int joinNum, String isJoin,
			String userId, String info) {
		super();
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.category = category;
		this.filePath = filePath;
		this.joinNum = joinNum;
		this.isJoin = isJoin;
		this.userId = userId;
		this.info = info;
	}


	public String getGroupNo() {
		return groupNo;
	}


	public void setGroupNo(String groupNo) {
		this.groupNo = groupNo;
	}


	public String getGroupName() {
		return groupName;
	}


	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public int getJoinNum() {
		return joinNum;
	}


	public void setJoinNum(int joinNum) {
		this.joinNum = joinNum;
	}


	public String getIsJoin() {
		return isJoin;
	}


	public void setIsJoin(String isJoin) {
		this.isJoin = isJoin;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}
	
	
	
}
