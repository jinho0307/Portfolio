package movie.model.vo;

import java.sql.Date;

public class MovieComment {

	private int cNumber;
	private String userId;
	private String mId;
	private String mComment;
	private Date cDate;
	
	
	
	public MovieComment() {
		super();
	}
	public MovieComment(int cNumber, String userId, String mId, String mComment, Date cDate) {
		super();
		this.cNumber = cNumber;
		this.userId = userId;
		this.mId = mId;
		this.mComment = mComment;
		this.cDate = cDate;
	}
	public int getcNumber() {
		return cNumber;
	}
	public void setcNumber(int cNumber) {
		this.cNumber = cNumber;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getmComment() {
		return mComment;
	}
	public void setmComment(String mComment) {
		this.mComment = mComment;
	}
	public Date getcDate() {
		return cDate;
	}
	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}
	@Override
	public String toString() {
		return  cNumber + ", " + userId + ", " + mId + ", " + mComment
				+ ", " + cDate;
	}
	
	
	
	
}
