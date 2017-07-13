package com.seven.sins.channel.vo;

import java.sql.Date;


@SuppressWarnings("serial")
public class ChannelVO implements java.io.Serializable {

	private int channel_no;
	private int follow_count;
	private String channel_user_id;
	private String channel_name;
	private Date channel_create_date;
	private String channel_filepath;
	private String channel_keyword;
	private String channel_like;
	private String channel_info;
	private String category1;
	private String delete_yn;
	private int chan_article_no;
	private String chan_article_content;
	private Date chan_article_write_date;
	private String chan_article_filepath;
	private String chan_article_like;
	private String user_id_bak;
	private String classify;
	private String user_id;
	private int like_amount;
	public int getChannel_no() {
		return channel_no;
	}
	public void setChannel_no(int channel_no) {
		this.channel_no = channel_no;
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
	
	public String getchannel_filepath() {
		return channel_filepath;
	}
	public void setchannel_filepath(String channel_filepath) {
		this.channel_filepath = channel_filepath;
	}
	public String getChannel_keyword() {
		return channel_keyword;
	}
	public void setChannel_keyword(String channel_keyword) {
		this.channel_keyword = channel_keyword;
	}
	public String getChannel_like() {
		return channel_like;
	}
	public void setChannel_like(String channel_like) {
		this.channel_like = channel_like;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
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
	
	public String getChannel_info() {
		return channel_info;
	}
	public void setChannel_info(String channel_info) {
		this.channel_info = channel_info;
	}
	
	public ChannelVO() {
		super();
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
	
	
	public int getFollow_count() {
		return follow_count;
	}
	public void setFollow_count(int follow_count) {
		this.follow_count = follow_count;
	}
	public String getChannel_filepath() {
		return channel_filepath;
	}
	public void setChannel_filepath(String channel_filepath) {
		this.channel_filepath = channel_filepath;
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
	public ChannelVO(int channel_no, int follow_count, String channel_user_id, String channel_name,
			Date channel_create_date, String channel_filepath, String channel_keyword, String channel_like,
			String channel_info, String category1, String delete_yn, int chan_article_no, String chan_article_content,
			Date chan_article_write_date, String chan_article_filepath, String chan_article_like, String user_id_bak,
			String classify, String user_id, int like_amount) {
		super();
		this.channel_no = channel_no;
		this.follow_count = follow_count;
		this.channel_user_id = channel_user_id;
		this.channel_name = channel_name;
		this.channel_create_date = channel_create_date;
		this.channel_filepath = channel_filepath;
		this.channel_keyword = channel_keyword;
		this.channel_like = channel_like;
		this.channel_info = channel_info;
		this.category1 = category1;
		this.delete_yn = delete_yn;
		this.chan_article_no = chan_article_no;
		this.chan_article_content = chan_article_content;
		this.chan_article_write_date = chan_article_write_date;
		this.chan_article_filepath = chan_article_filepath;
		this.chan_article_like = chan_article_like;
		this.user_id_bak = user_id_bak;
		this.classify = classify;
		this.user_id = user_id;
		this.like_amount = like_amount;
	}
	@Override
	public String toString() {
		return "ChannelVO [channel_no=" + channel_no + ", follow_count=" + follow_count + ", channel_user_id="
				+ channel_user_id + ", channel_name=" + channel_name + ", channel_create_date=" + channel_create_date
				+ ", channel_filepath=" + channel_filepath + ", channel_keyword=" + channel_keyword + ", channel_like="
				+ channel_like + ", channel_info=" + channel_info + ", category1=" + category1 + ", delete_yn="
				+ delete_yn + ", chan_article_no=" + chan_article_no + ", chan_article_content=" + chan_article_content
				+ ", chan_article_write_date=" + chan_article_write_date + ", chan_article_filepath="
				+ chan_article_filepath + ", chan_article_like=" + chan_article_like + ", user_id_bak=" + user_id_bak
				+ ", classify=" + classify + ", user_id=" + user_id + "]";
	}
	
	
	
	
}
