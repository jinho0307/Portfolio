package com.seven.sins.channel.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class ChannelListVO implements java.io.Serializable{
	private int channel_no;
	private String channel_user_id;
	private String channel_name;
	private Date channel_create_date;
	private String channel_filepath;
	private String channel_keyword;
	private int channel_like;
	private String category1;
	private String delete_yn;
	private String channel_info;
	
	public ChannelListVO() {
		super();
	}
	public ChannelListVO(int channel_no, String channel_user_id, String channel_name, Date channel_create_date,
			String channel_filepath, String channel_keyword, int channel_like, String category1, String delete_yn,
			String channel_info, int like_amount) {
		super();
		this.channel_no = channel_no;
		this.channel_user_id = channel_user_id;
		this.channel_name = channel_name;
		this.channel_create_date = channel_create_date;
		this.channel_filepath = channel_filepath;
		this.channel_keyword = channel_keyword;
		this.channel_like = channel_like;
		this.category1 = category1;
		this.delete_yn = delete_yn;
		this.channel_info = channel_info;
	}
	
	public int getChannel_no() {
		return channel_no;
	}
	public void setChannel_no(int channel_no) {
		this.channel_no = channel_no;
	}
	public String getChannel_user_id() {
		return channel_user_id;
	}
	public void setChannel_user_id(String channel_user_id) {
		this.channel_user_id = channel_user_id;
	}
	public String getChannel_name() {
		return channel_name;
	}
	public void setChannel_name(String channel_name) {
		this.channel_name = channel_name;
	}
	public Date getChannel_create_date() {
		return channel_create_date;
	}
	public void setChannel_create_date(Date channel_create_date) {
		this.channel_create_date = channel_create_date;
	}
	public String getChannel_filepath() {
		return channel_filepath;
	}
	public void setChannel_filepath(String channel_filepath) {
		this.channel_filepath = channel_filepath;
	}
	public String getChannel_keyword() {
		return channel_keyword;
	}
	public void setChannel_keyword(String channel_keyword) {
		this.channel_keyword = channel_keyword;
	}
	public int getChannel_like() {
		return channel_like;
	}
	public void setChannel_like(int channel_like) {
		this.channel_like = channel_like;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}
	public String getChannel_info() {
		return channel_info;
	}
	public void setChannel_info(String channel_info) {
		this.channel_info = channel_info;
	}
	@Override
	public String toString() {
		return "ChannelListVO [channel_no=" + channel_no + ", channel_user_id=" + channel_user_id + ", channel_name="
				+ channel_name + ", channel_create_date=" + channel_create_date + ", channel_filepath="
				+ channel_filepath + ", channel_keyword=" + channel_keyword + ", channel_like=" + channel_like
				+ ", category1=" + category1 + ", delete_yn=" + delete_yn + ", channel_info=" + channel_info
				+ "]";
	}
	
}
