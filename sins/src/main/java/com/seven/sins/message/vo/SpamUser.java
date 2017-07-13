package com.seven.sins.message.vo;

import java.io.Serializable;

public class SpamUser implements Serializable{
	private String spam_id;
	private String user_name;
	public SpamUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SpamUser(String spam_id, String user_name) {
		super();
		this.spam_id = spam_id;
		this.user_name = user_name;
	}
	public String getSpam_id() {
		return spam_id;
	}
	public void setSpam_id(String spam_id) {
		this.spam_id = spam_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
}
