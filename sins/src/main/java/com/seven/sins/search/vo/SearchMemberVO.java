package com.seven.sins.search.vo;

@SuppressWarnings("serial")
public class SearchMemberVO implements java.io.Serializable {

	private String userId;
	private String userName;
	private String userProfile;
	private String isFriend;
	private String address;
	
	
	public SearchMemberVO(){}
	
	
	
	public SearchMemberVO(String userId, String userName, String userProfile, String isFriend, String address) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userProfile = userProfile;
		this.isFriend = isFriend;
		this.address = address;
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

	
	
	public String getIsFriend() {
		return isFriend;
	}



	public void setIsFriend(String isFriend) {
		this.isFriend = isFriend;
	}



	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
}
