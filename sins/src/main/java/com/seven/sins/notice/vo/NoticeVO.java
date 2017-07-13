package com.seven.sins.notice.vo;

import java.sql.Date;

public class NoticeVO implements java.io.Serializable{
	private int noticeNo;
	private String title;
	private String content;
	private String filepath;
	private Date writeDate;
	private int readCount;
	
	public NoticeVO() {}

	public NoticeVO(int noticeNo, String title, String content, String filepath, Date writeDate, int readCount) {
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
		this.filepath = filepath;
		this.writeDate = writeDate;
		this.readCount = readCount;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public Date getwriteDate() {
		return writeDate;
	}

	public void setwriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", title=" + title + ", content=" + content + ", filepath=" + filepath
				+ ", writeDate=" + writeDate + ", readCount=" + readCount + "]";
	}
	
	
}
