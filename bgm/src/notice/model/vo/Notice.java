package notice.model.vo;

import java.sql.Date;

public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String cinemaId;
	private int readCount;
	private String category;
	private String userId;
	private Date noticeDate;
	private String originalFilepath;
	private String renameFilepath;

	public Notice() {
	}

	public Notice(String noticeTitle, String userId, String noticeContent, String category, String cinemaId,
			String originalFilepath, String renameFilepath) {
		super();
		this.noticeTitle = noticeTitle;
		this.userId = userId;
		this.noticeContent = noticeContent;
		this.category = category;
		this.cinemaId = cinemaId;
		this.originalFilepath = originalFilepath;
		this.renameFilepath = renameFilepath;
	}

	public Notice(int noticeNo, String noticeTitle, String userId, String noticeContent, String category,
			String cinemaId, String originalFilepath, String renameFilepath) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.userId = userId;
		this.noticeContent = noticeContent;
		this.category = category;
		this.cinemaId = cinemaId;
		this.originalFilepath = originalFilepath;
		this.renameFilepath = renameFilepath;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(String cinemaId) {
		this.cinemaId = cinemaId;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}

	public String getOriginalFilepath() {
		return originalFilepath;
	}

	public void setOriginalFilepath(String originalFilepath) {
		this.originalFilepath = originalFilepath;
	}

	public String getRenameFilepath() {
		return renameFilepath;
	}

	public void setRenameFilepath(String renameFilepath) {
		this.renameFilepath = renameFilepath;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", cinemaId=" + cinemaId + ", readCount=" + readCount + ", category=" + category + ", userId="
				+ userId + ", noticeDate=" + noticeDate + "]";
	}
}
