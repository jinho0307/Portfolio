package com.seven.sins.qna.vo;

import java.sql.Date;

@SuppressWarnings("serial")
public class QnaComment implements java.io.Serializable {

	private int commentNo;
	private String userId;
	private String content;
	private Date writeDate;
	private int lev;
	private int ref;
	private String filepath;
	private String backupId;
	private int qnaNo;
	private String classify;
	
	public QnaComment(){}
	
	
	public QnaComment(int commentNo, String userId, String content, Date writeDate, int lev, int ref, String filepath,
			String backupId, int qnaNo, String classify) {
		super();
		this.commentNo = commentNo;
		this.userId = userId;
		this.content = content;
		this.writeDate = writeDate;
		this.lev = lev;
		this.ref = ref;
		this.filepath = filepath;
		this.backupId = backupId;
		this.qnaNo = qnaNo;
		this.classify = classify;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
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
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getBackupId() {
		return backupId;
	}
	public void setBackupId(String backupId) {
		this.backupId = backupId;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	
	


}
