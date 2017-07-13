package news.model.vo;

import java.sql.Date;

public class NewsURL implements java.io.Serializable {

	private String companyName;
	private String newsURL;
	private String newsTitle;
	private int count;
	private Date uploadDate;
	private String image;

	public NewsURL(String companyName, String newsURL, String newsTitle, int count, Date uploadDate, String image) {
		
		this.companyName = companyName;
		this.newsURL = newsURL;
		this.newsTitle = newsTitle;
		this.count=count;
		this.uploadDate=uploadDate;
		this.image=image;
		
	}

	
	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}



	public String getNewsURL() {
		return newsURL;
	}


	public void setNewsURL(String newsURL) {
		this.newsURL = newsURL;
	}


	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

}
