package com.seven.sins.mypage.vo;

public class MypageLikeVO {
	
	private int writeNo;
	private String userid;
	private String classfy;
	
	
	
	public MypageLikeVO(){}
	
	public MypageLikeVO(int writeNo, String userid, String classfy) {
		super();
		this.writeNo = writeNo;
		this.userid = userid;
		this.classfy = classfy;
	}

	public int getWriteNo() {
		return writeNo;
	}

	public void setWriteNo(int writeNo) {
		this.writeNo = writeNo;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getClassfy() {
		return classfy;
	}

	public void setClassfy(String classfy) {
		this.classfy = classfy;
	}

	@Override
	public String toString() {
		return "MypageLikeVO [writeNo=" + writeNo + ", userid=" + userid + ", classfy=" + classfy + "]";
	}
	
	
	
	

}
