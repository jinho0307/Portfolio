package com.seven.sins.channel.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class ChannelCommentVO implements java.io.Serializable {
	
	private String chan_article_content;
	private Date comment_date;
	private int lev;
	private int ref;
	private String chan_article_filepath;
	private String delete_yn;
	private String user_id_bak;
	private int chan_article_no;
	private String user_id;
	private String classify;
	private int report;
	private String content;
	private int comment_no;
	private String backup_id;
	
	public ChannelCommentVO() {
		super();
	}
	public ChannelCommentVO(String chan_article_content, Date comment_date, int lev, int ref,
			String chan_article_filepath, String delete_yn, String user_id_bak, int chan_article_no, String user_id,
			String classify, int report, String content, int comment_no, String backup_id) {
		super();
		this.chan_article_content = chan_article_content;
		this.comment_date = comment_date;
		this.lev = lev;
		this.ref = ref;
		this.chan_article_filepath = chan_article_filepath;
		this.delete_yn = delete_yn;
		this.user_id_bak = user_id_bak;
		this.chan_article_no = chan_article_no;
		this.user_id = user_id;
		this.classify = classify;
		this.report = report;
		this.content = content;
		this.comment_no = comment_no;
		this.backup_id=backup_id;
	}
	public String getChan_article_content() {
		return chan_article_content;
	}
	public void setChan_article_content(String chan_article_content) {
		this.chan_article_content = chan_article_content;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	public int getlev() {
		return lev;
	}
	public void setlev(int lev) {
		this.lev = lev;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public String getChan_article_filepath() {
		return chan_article_filepath;
	}
	public void setChan_article_filepath(String chan_article_filepath) {
		this.chan_article_filepath = chan_article_filepath;
	}
	public String getDelete_yn() {
		return delete_yn;
	}
	public void setDelete_yn(String delete_yn) {
		this.delete_yn = delete_yn;
	}
	public String getUser_id_bak() {
		return user_id_bak;
	}
	public void setUser_id_bak(String user_id_bak) {
		this.user_id_bak = user_id_bak;
	}
	public int getChan_article_no() {
		return chan_article_no;
	}
	public void setChan_article_no(int chan_article_no) {
		this.chan_article_no = chan_article_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public String getBackup_id() {
		return backup_id;
	}
	public void setBackup_id(String backup_id) {
		this.backup_id = backup_id;
	}
	@Override
	public String toString() {
		return "ChannelCommentVO [chan_article_content=" + chan_article_content + ", comment_date=" + comment_date
				+ ", lev=" + lev + ", ref=" + ref + ", chan_article_filepath=" + chan_article_filepath + ", delete_yn="
				+ delete_yn + ", user_id_bak=" + user_id_bak + ", chan_article_no=" + chan_article_no + ", user_id="
				+ user_id + ", classify=" + classify + ", report=" + report + ", content=" + content + ", comment_no="
				+ comment_no + "]";
	}
	
}