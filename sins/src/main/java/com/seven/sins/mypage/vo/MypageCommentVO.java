package com.seven.sins.mypage.vo;

import java.sql.Date;
@SuppressWarnings("serial")
public class MypageCommentVO {

	private int commentno;
	private String userid;
	private String content;
	private Date commentdate;
	private int lev;
	private int ref;
	private String photopath;
	private String backupid;
	private int contentno;
	private String classfy;
	private int report;
	private String username;
	private String userprofile;
	
	
	public MypageCommentVO() {
		super();
	}

	//MYPAGE_COMMENT 용
	public MypageCommentVO(int commentno, String userid, String content, Date commentdate, int lev, int ref,
			String photopath, String backupid, int contentno, String classfy, int report, String username, String userprofile) {
		super();
		this.commentno = commentno;
		this.userid = userid;
		this.content = content;
		this.commentdate = commentdate;
		this.lev = lev;
		this.ref = ref;
		this.photopath = photopath;
		this.backupid = backupid;
		this.contentno = contentno;
		this.classfy = classfy;
		this.report = report;
		this.username = username;
		this.userprofile = userprofile;
	}

	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserprofile() {
		return userprofile;
	}

	public void setUserprofile(String userprofile) {
		this.userprofile = userprofile;
	}

	public int getCommentno() {
		return commentno;
	}

	public void setCommentno(int commentno) {
		this.commentno = commentno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public Date getCommentdate() {
		return commentdate;
	}

	public void setCommentdate(Date commentdate) {
		this.commentdate = commentdate;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public String getPhotopath() {
		return photopath;
	}

	public void setPhotopath(String photopath) {
		this.photopath = photopath;
	}

	public String getBackupid() {
		return backupid;
	}

	public void setBackupid(String backupid) {
		this.backupid = backupid;
	}

	public int getContentno() {
		return contentno;
	}

	public void setContentno(int contentno) {
		this.contentno = contentno;
	}

	public String getClassfy() {
		return classfy;
	}

	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}

	@Override
	public String toString() {
		return  commentno + ", " + userid + ", " + content + ", "
				+ commentdate + ", " + lev + ", " + ref + ", " + photopath + ", " + backupid
				+ ", " + contentno + ", " + classfy + ", " + report + ", " + username + ", " + userprofile;
	}
	
	
}
