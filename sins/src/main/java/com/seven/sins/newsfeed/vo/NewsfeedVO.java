package com.seven.sins.newsfeed.vo;

import java.sql.Date;

public class NewsfeedVO {
	
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
	
	private int groupNo;
	private int groupNoBak;
	private String groupNameBak;
	private String userIdBak;
	private String deleteYN;
	
	private int channel_no;
	private String channel_user_id;
	
	public NewsfeedVO() {
		super();
	}

	public NewsfeedVO(int writeno, String userid, String filepath, String content, String keyword, Date writedate,
			int writelike, String backupid, String classify, String createid, int report, String username,
			String userprofile, int groupNo, int groupNoBak, String groupNameBak, String userIdBak, String deleteYN,
			int channel_no, String channel_user_id) {
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
		this.groupNo = groupNo;
		this.groupNoBak = groupNoBak;
		this.groupNameBak = groupNameBak;
		this.userIdBak = userIdBak;
		this.deleteYN = deleteYN;
		this.channel_no = channel_no;
		this.channel_user_id = channel_user_id;
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

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
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

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getGroupNoBak() {
		return groupNoBak;
	}

	public void setGroupNoBak(int groupNoBak) {
		this.groupNoBak = groupNoBak;
	}

	public String getGroupNameBak() {
		return groupNameBak;
	}

	public void setGroupNameBak(String groupNameBak) {
		this.groupNameBak = groupNameBak;
	}

	public String getUserIdBak() {
		return userIdBak;
	}

	public void setUserIdBak(String userIdBak) {
		this.userIdBak = userIdBak;
	}

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
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

	@Override
	public String toString() {
		return "NewsfeedVO [writeno=" + writeno + ", userid=" + userid + ", filepath=" + filepath + ", content="
				+ content + ", keyword=" + keyword + ", writedate=" + writedate + ", writelike=" + writelike
				+ ", backupid=" + backupid + ", classify=" + classify + ", createid=" + createid + ", report=" + report
				+ ", username=" + username + ", userprofile=" + userprofile + ", groupNo=" + groupNo + ", groupNoBak="
				+ groupNoBak + ", groupNameBak=" + groupNameBak + ", userIdBak=" + userIdBak + ", deleteYN=" + deleteYN
				+ ", channel_no=" + channel_no + ", channel_user_id=" + channel_user_id + "]";
	}
	
	
	
	
}
