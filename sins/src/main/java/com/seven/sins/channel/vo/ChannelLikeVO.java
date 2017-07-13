package com.seven.sins.channel.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class ChannelLikeVO implements java.io.Serializable{
	private int channel_no;
	private int chan_article_no;
	private String classify;
	private String user_id;
	public int getChannel_no() {
		return channel_no;
	}
	public void setChannel_no(int channel_no) {
		this.channel_no = channel_no;
	}
	public int getChan_article_no() {
		return chan_article_no;
	}
	public void setChan_article_no(int chan_article_no) {
		this.chan_article_no = chan_article_no;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public ChannelLikeVO() {
	}
	public ChannelLikeVO(int channel_no, int chan_article_no, String classify, String user_id) {
		super();
		this.channel_no = channel_no;
		this.chan_article_no = chan_article_no;
		this.classify = classify;
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "ChannelLikeVO [channel_no=" + channel_no + ", chan_article_no=" + chan_article_no + ", classify="
				+ classify + ", user_id=" + user_id + "]";
	}
	
}
