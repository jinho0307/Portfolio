package com.seven.sins.message.vo;

import java.io.Serializable;
import java.sql.Date;
@SuppressWarnings("messagevo")
public class MessageVO implements Serializable{
	
	private String send_id;
	private String receivie_id;
	private String content;
	private Date message_date; 
	private String filepath;
	private String mes_req_del;
	private String mes_res_del;
	private String classify;
	private String read_check;
	private int message_no;
	private String user_name;
	private String profile;
	public MessageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MessageVO(String send_id, String receivie_id, String content, Date message_date, String filepath,
			String mes_req_del, String mes_res_del, String classify, String read_check, int message_no,
			String user_name, String profile) {
		super();
		this.send_id = send_id;
		this.receivie_id = receivie_id;
		this.content = content;
		this.message_date = message_date;
		this.filepath = filepath;
		this.mes_req_del = mes_req_del;
		this.mes_res_del = mes_res_del;
		this.classify = classify;
		this.read_check = read_check;
		this.message_no = message_no;
		this.user_name = user_name;
		this.profile = profile;
	}
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getReceivie_id() {
		return receivie_id;
	}
	public void setReceivie_id(String receivie_id) {
		this.receivie_id = receivie_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getMes_req_del() {
		return mes_req_del;
	}
	public void setMes_req_del(String mes_req_del) {
		this.mes_req_del = mes_req_del;
	}
	public String getMes_res_del() {
		return mes_res_del;
	}
	public void setMes_res_del(String mes_res_del) {
		this.mes_res_del = mes_res_del;
	}
	public String getClassify() {
		return classify;
	}
	public void setClassify(String classify) {
		this.classify = classify;
	}
	public String getRead_check() {
		return read_check;
	}
	public void setRead_check(String read_check) {
		this.read_check = read_check;
	}
	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
}
