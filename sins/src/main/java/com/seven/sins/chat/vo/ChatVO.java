package com.seven.sins.chat.vo;

public class ChatVO {
	private int groupno;
	private String type;
	private String text;
	private String id;
	private String date;
	public ChatVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChatVO(int groupno, String type, String text, String id, String date) {
		super();
		this.groupno = groupno;
		this.type = type;
		this.text = text;
		this.id = id;
		this.date = date;
	}
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
