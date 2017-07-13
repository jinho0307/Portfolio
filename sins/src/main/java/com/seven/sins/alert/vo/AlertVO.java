package com.seven.sins.alert.vo;

import java.io.Serializable;
import java.sql.Date;

@SuppressWarnings("serial")
public class AlertVO implements Serializable{
	private String user_id;
	private String classify;
	private int content_no;
	private Date insert_date;
	private int lev;
	private int coment_no;
	private String filepath;
	private String send_id;
	private String type;
	private String ii;
	public AlertVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AlertVO(String user_id, String classify, int content_no, Date insert_date, int lev, int coment_no,
			String filepath, String send_id, String type, String ii) {
		super();
		this.user_id = user_id;
		this.classify = classify;
		this.content_no = content_no;
		this.insert_date = insert_date;
		this.lev = lev;
		this.coment_no = coment_no;
		this.filepath = filepath;
		this.send_id = send_id;
		this.type = type;
		this.ii = ii;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public int getContent_no() {
		return content_no;
	}
	public void setContent_no(int content_no) {
		this.content_no = content_no;
	}
	public Date getInsert_date() {
		return insert_date;
	}
	public void setInsert_date(Date insert_date) {
		this.insert_date = insert_date;
	}
	public int getLev() {
		return lev;
	}
	public void setLev(int lev) {
		this.lev = lev;
	}
	public int getComent_no() {
		return coment_no;
	}
	public void setComent_no(int coment_no) {
		this.coment_no = coment_no;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getIi() {
		return ii;
	}
	public void setIi(String ii) {
		this.ii = ii;
	}
	
}
