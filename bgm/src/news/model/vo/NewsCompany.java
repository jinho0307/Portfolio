package news.model.vo;

public class NewsCompany implements java.io.Serializable {

	private int companyNo;
	private String companyName;
	private String mainURL;
	private String image;
	private int price;
	private int deposit;


	public NewsCompany() {
	}

	

	public NewsCompany(int companyNo, String companyName, String mainURL, String image, int price, int deposit) {

		this.companyNo = companyNo;
		this.companyName = companyName;
		this.mainURL = mainURL;
		this.image = image;
		this.price = price;
		this.deposit=deposit;
		
	}

	public int getCompanyNo() {
		return companyNo;
	}

	public void setCompanyNo(int companyNo) {
		this.companyNo = companyNo;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getMainURL() {
		return mainURL;
	}

	public void setMainURL(String mainURL) {
		this.mainURL = mainURL;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	

}
