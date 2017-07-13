package com.seven.sins.message.vo;

import java.io.Serializable;

@SuppressWarnings("messagelistvo")
public class MessageListVO implements Serializable{
	private String loginid;
	private String select;
	private String seach;
	public MessageListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MessageListVO(String loginid, String select, String seach) {
		super();
		this.loginid = loginid;
		this.select = select;
		this.seach = seach;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	public String getSelect() {
		return select;
	}
	public void setSelect(String select) {
		this.select = select;
	}
	public String getSeach() {
		return seach;
	}
	public void setSeach(String seach) {
		this.seach = seach;
	}
	
}
