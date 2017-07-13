package pay.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Cash implements Serializable{
	private String userId;
	private int company_no;
	private String movieId;
	private int cash;
	private int totalCash;
	private Date user_date;
	
	@Override
	public String toString() {	
		return userId +","+ this.company_no +","+ this.movieId+","+this.cash+","+totalCash;
	}

	public Cash() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Cash(String userId, int company_no, String movieId, int cash, int totalCash, Date user_date) {
		super();
		this.userId = userId;
		this.company_no = company_no;
		this.movieId = movieId;
		this.cash = cash;
		this.totalCash = totalCash;
		this.user_date = user_date;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getCompany_no() {
		return company_no;
	}

	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getTotalCash() {
		return totalCash;
	}

	public void setTotalCash(int totalCash) {
		this.totalCash = totalCash;
	}

	public Date getUser_date() {
		return user_date;
	}

	public void setUser_date(Date user_date) {
		this.user_date = user_date;
	}
	
	
}
