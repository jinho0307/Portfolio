package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	private String userId;
	private String password;
	private String userName;
	private Date birth;
	private Date enroll_date;
	private char gender;
	private String phone;
	private String reception; 
	private String zipcode1;
	private String zipcode2;
	private String address1;
	private String address2;
	private String email;
	private int manager;
	private int totalCash;
	/*@Override
	public String toString() {
		return userId + " " + password + " " + userName + " " + birth + " " + enroll_date + " " +
				gender + " " + phone + " " +reception+ " " +this.zipcode1+ " " +this.zipcode2+ " " + address1 + " " +address2 + " " + email + " " +manager;
	}*/

	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String userId, String password, String userName, Date birth, Date enroll_date, char gender,
			String phone, String reception, String zipcode1, String zipcode2, String address1, String address2,
			String email, int manager, int totalCash) {
		super();
		this.userId = userId;
		this.password = password;
		this.userName = userName;
		this.birth = birth;
		this.enroll_date = enroll_date;
		this.gender = gender;
		this.phone = phone;
		this.reception = reception;
		this.zipcode1 = zipcode1;
		this.zipcode2 = zipcode2;
		this.address1 = address1;
		this.address2 = address2;
		this.email = email;
		this.manager = manager;
		this.totalCash = totalCash;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public Date getEnroll_date() {
		return enroll_date;
	}
	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getReception() {
		return reception;
	}
	public void setReception(String reception) {
		this.reception = reception;
	}
	public String getZipcode1() {
		return zipcode1;
	}
	public void setZipcode1(String zipcode1) {
		this.zipcode1 = zipcode1;
	}
	public String getZipcode2() {
		return zipcode2;
	}
	public void setZipcode2(String zipcode2) {
		this.zipcode2 = zipcode2;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getManager() {
		return manager;
	}
	public void setManager(int manager) {
		this.manager = manager;
	}
	public int getTotalCash() {
		return totalCash;
	}
	public void setTotalCash(int totalCash) {
		this.totalCash = totalCash;
	}
	
}
