package news.model.vo;

import java.sql.Date;

public class Subscription implements java.io.Serializable{

	private String id;
	private int companyNo;
	private int amount;
	private Date startDate;
	private Date endDate;
	public Subscription(String id, int companyNo, int amount, Date startDate, Date endDate) {
		
		this.id = id;
		this.companyNo = companyNo;
		this.amount = amount;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCompanyNo() {
		return companyNo;
	}
	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	
	
	
}




