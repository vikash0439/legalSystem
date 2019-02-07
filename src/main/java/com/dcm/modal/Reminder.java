package com.dcm.modal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="reminder")
public class Reminder {
	
	@Id
	private int reminderid;
	private String type;
	private String caseno;
	private String brief;
	private String date;
	private String time;
	
	
	public int getReminderid() {
		return reminderid;
	}
	public void setReminderid(int reminderid) {
		this.reminderid = reminderid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCaseno() {
		return caseno;
	}
	public void setCaseno(String caseno) {
		this.caseno = caseno;
	}
	public String getBrief() {
		return brief;
	}
	public void setBrief(String brief) {
		this.brief = brief;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

}
