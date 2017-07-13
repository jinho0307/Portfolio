package com.seven.sins.search.vo;



@SuppressWarnings("serial")
public class SearchChannelVO implements java.io.Serializable{


	private String channelNo;
	private String channelName;
	private String filePath;
	private String category;
	private int like;
	private String isFollow;
	private String userId;
	private String info;
	
	
	public SearchChannelVO(){}



	public SearchChannelVO(String channelNo, String channelName, String filePath, String category, int like,
			String isFollow, String userId, String info) {
		super();
		this.channelNo = channelNo;
		this.channelName = channelName;
		this.filePath = filePath;
		this.category = category;
		this.like = like;
		this.isFollow = isFollow;
		this.userId = userId;
		this.info=info;
	}



	public String getChannelNo() {
		return channelNo;
	}



	public void setChannelNo(String channelNo) {
		this.channelNo = channelNo;
	}



	public String getChannelName() {
		return channelName;
	}



	public void setChannelName(String channelName) {
		this.channelName = channelName;
	}



	public String getFilePath() {
		return filePath;
	}



	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public int getLike() {
		return like;
	}



	public void setLike(int like) {
		this.like = like;
	}



	public String getIsFollow() {
		return isFollow;
	}



	public void setIsFollow(String isFollow) {
		this.isFollow = isFollow;
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