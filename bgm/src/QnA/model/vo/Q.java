package QnA.model.vo;

import java.sql.Date;

public class Q {
	private int qNo;
	private String qTitle;
	private String qContent;
	private String cinemaId;
	private int qReadCount;
	private String qCategory;
	private String userId;
	private Date qDate;
	private String originalFilepath;
	private String renameFilepath;
	private String answer;
	
	public Q() {}

	public Q(int qNo, String qTitle, String qContent, String cinemaId, int qReadCount, String qCategory, String userId,
			Date qDate, String originalFilepath, String renameFilepath, String answer) {
		super();
		this.qNo = qNo;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.cinemaId = cinemaId;
		this.qReadCount = qReadCount;
		this.qCategory = qCategory;
		this.userId = userId;
		this.qDate = qDate;
		this.originalFilepath = originalFilepath;
		this.renameFilepath = renameFilepath;
		this.answer = answer;
	}

	public Q (String qTitle, String userId, String qContent, String category, String cinemaId,
			String originalFilepath, String renameFilepath) {
		this.qTitle = qTitle;
		this.userId = userId;
		this.qContent = qContent;
		this.qCategory = category;
		this.cinemaId = cinemaId;
		this.originalFilepath = originalFilepath;
		this.renameFilepath = renameFilepath;
	}
	
	public Q(String qTitle, String qContent, String cinemaId, String qCategory, String userId) {
		super();
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.cinemaId = cinemaId;
		this.qCategory = qCategory;
		this.userId = userId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getCinemaId() {
		return cinemaId;
	}

	public void setCinemaId(String cinemaId) {
		this.cinemaId = cinemaId;
	}

	public int getqReadCount() {
		return qReadCount;
	}

	public void setqReadCount(int qReadCount) {
		this.qReadCount = qReadCount;
	}

	public String getqCategory() {
		return qCategory;
	}

	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getqDate() {
		return qDate;
	}

	public void setqDate(Date qDate) {
		this.qDate = qDate;
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
		return "Q [qNo=" + qNo + ", qTitle=" + qTitle + ", qContent=" + qContent + ", cinemaId=" + cinemaId
				+ ", qReadCount=" + qReadCount + ", qCategory=" + qCategory + ", userId=" + userId + ", qDate=" + qDate
				+ ", originalFilepath=" + originalFilepath + ", renameFilepath=" + renameFilepath + ", answer=" + answer
				+ "]";
	}
}
