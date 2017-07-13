package com.seven.sins.mypage.vo;

import java.sql.Date;
@SuppressWarnings("serial")
public class MypageVO {
	
	private int writeno;
	private String userid;
	private String filepath;
	private String content;
	private String keyword;
	private Date writedate;
	private int writelike;
	private String backupid;
	private String classify;
	private String createid;
	private int report;
	private String username;
	private String userprofile;
	
	
	public MypageVO() {
		super();
	}

    //MY_PAGE 용
	public MypageVO(int writeno, String userid, String filepath, String content, String keyword, Date writedate,
			int writelike, String backupid, String classify, String createid, int report, String username, String userprofile) {
		super();
		this.writeno = writeno;
		this.userid = userid;
		this.filepath = filepath;
		this.content = content;
		this.keyword = keyword;
		this.writedate = writedate;
		this.writelike = writelike;
		this.backupid = backupid;
		this.classify = classify;
		this.createid = createid;
		this.report = report;
		this.username = username;
		this.userprofile = userprofile;
	}
	
	

    //MYPAGE_LIKE 용
	public MypageVO(int writeno, String userid, String classfy, String username, String userprofile) {
		super();
		this.writeno = writeno;
		this.userid = userid;
		this.classify = classfy;
		this.username = username;
		this.userprofile = userprofile;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getWriteno() {
		return writeno;
	}


	public void setWriteno(int writeno) {
		this.writeno = writeno;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getFilepath() {
		return filepath;
	}


	public void setFilepath(String filepath) {
		this.filepath = filepath;
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

	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public Date getWritedate() {
		return writedate;
	}


	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getWritelike() {
		return writelike;
	}

	public void setWritelike(int writelike) {
		this.writelike = writelike;
	}

	public String getBackupid() {
		return backupid;
	}


	public void setBackupid(String backupid) {
		this.backupid = backupid;
	}


	public String getClassify() {
		return classify;
	}


	public void setClassify(String classify) {
		this.classify = classify;
	}


	public String getCreateid() {
		return createid;
	}


	public void setCreateid(String createid) {
		this.createid = createid;
	}
	
	public int getNumber() {
		return report;
	}

	public void setNumber(int report) {
		this.report = report;
	}
	

	public String getUserprofile() {
		return userprofile;
	}

	public void setUserprofile(String userprofile) {
		this.userprofile = userprofile;
	}

	@Override
	public String toString() {
		return writeno + ", " + userid + ", " + filepath + ", " + content
				+ ", " + keyword + ", " + writedate + ", " + writelike + ", "
				+ backupid + ", " + classify + ", " + createid + ", " + report + ", " + username + ", " + userprofile;
	}
	
	

}
