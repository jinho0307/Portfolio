package notice.model.vo;

import java.sql.Date;

public class NoticeComment {

	private int commentNo;
	private String userId;
	private int noticeNo;
	private String commentContent;
	private Date commentDate;
	
	public NoticeComment() {
		// TODO Auto-generated constructor stub
	}

	public NoticeComment(int commentNo, String userId, int noticeNo, String commentContent, Date commentDate) {
		super();
		this.commentNo = commentNo;
		this.userId = userId;
		this.noticeNo = noticeNo;
		this.commentContent = commentContent;
		this.commentDate = commentDate;
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

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	@Override
	public String toString() {
		return "NoticeComment [commentNo=" + commentNo + ", userId=" + userId + ", noticeNo=" + noticeNo
				+ ", commentContent=" + commentContent + ", commentDate=" + commentDate + "]";
	}
}
