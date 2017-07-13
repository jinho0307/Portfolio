package com.seven.sins.channel.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class ChannelArticleVO implements java.io.Serializable {
	private int channel_no;
	private String channel_user_id;
	private String delete_yn;
	private int chan_article_no;
	private String chan_article_content;
	private Date chan_article_write_date;
	private String chan_article_filepath;
	private String chan_article_like;
	private String user_id_bak;
	private String classify;
	private int report;
	private String user_id;
	private int like_amount;
	private int comment_no;
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
	public String getDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}
	public int getChan_article_no() {
		return chan_article_no;
	}
	public void setChan_article_no(int chan_article_no) {
		this.chan_article_no = chan_article_no;
	}
	public String getChan_article_content() {
		return chan_article_content;
	}
	public void setChan_article_content(String chan_article_content) {
		this.chan_article_content = chan_article_content;
	}
	public Date getChan_article_write_date() {
		return chan_article_write_date;
	}
	public void setChan_article_write_date(Date chan_article_write_date) {
		this.chan_article_write_date = chan_article_write_date;
	}
	public String getChan_article_filepath() {
		return chan_article_filepath;
	}
	public void setChan_article_filepath(String chan_article_filepath) {
		this.chan_article_filepath = chan_article_filepath;
	}
	public String getChan_article_like() {
		return chan_article_like;
	}
	public void setChan_article_like(String chan_article_like) {
		this.chan_article_like = chan_article_like;
	}
	public String getUser_id_bak() {
		return user_id_bak;
	}
	public void setUser_id_bak(String user_id_bak) {
		this.user_id_bak = user_id_bak;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public int getLike_amount() {
		return like_amount;
	}
	public void setLike_amount(int like_amount) {
		this.like_amount = like_amount;
	}
	public ChannelArticleVO() {
		super();
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public ChannelArticleVO(int channel_no, String channel_user_id, String delete_yn, int chan_article_no,
			String chan_article_content, Date chan_article_write_date, String chan_article_filepath,
			String chan_article_like, String user_id_bak, String classify, int report, String user_id, int like_amount,
			int comment_no) {
		super();
		this.channel_no = channel_no;
		this.channel_user_id = channel_user_id;
		this.delete_yn = delete_yn;
		this.chan_article_no = chan_article_no;
		this.chan_article_content = chan_article_content;
		this.chan_article_write_date = chan_article_write_date;
		this.chan_article_filepath = chan_article_filepath;
		this.chan_article_like = chan_article_like;
		this.user_id_bak = user_id_bak;
		this.classify = classify;
		this.report = report;
		this.user_id = user_id;
		this.like_amount = like_amount;
		this.comment_no = comment_no;
	}
	@Override
	public String toString() {
		return "ChannelArticleVO [channel_no=" + channel_no + ", channel_user_id=" + channel_user_id + ", delete_yn="
				+ delete_yn + ", chan_article_no=" + chan_article_no + ", chan_article_content=" + chan_article_content
				+ ", chan_article_write_date=" + chan_article_write_date + ", chan_article_filepath="
				+ chan_article_filepath + ", chan_article_like=" + chan_article_like + ", user_id_bak=" + user_id_bak
				+ ", classify=" + classify + ", report=" + report + ", user_id=" + user_id + ", like_amount="
				+ like_amount + ", comment_no=" + comment_no + "]";
	}
	
	
}
