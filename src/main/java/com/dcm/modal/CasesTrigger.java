package com.dcm.modal;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "casestrigger")
public class CasesTrigger {
	
	@Id
	private int triggerid;
	private int updateid;
	private String connected;
	private String nexthearing;
	private String status;
	private String cavet;
	private String lasthearing;
	
	
	public int getTriggerid() {
		return triggerid;
	}
	public void setTriggerid(int triggerid) {
		this.triggerid = triggerid;
	}
	public int getUpdateid() {
		return updateid;
	}
	public void setUpdateid(int updateid) {
		this.updateid = updateid;
	}
	public String getConnected() {
		return connected;
	}
	public void setConnected(String connected) {
		this.connected = connected;
	}
	public String getNexthearing() {
		return nexthearing;
	}
	public void setNexthearing(String nexthearing) {
		this.nexthearing = nexthearing;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCavet() {
		return cavet;
	}
	public void setCavet(String cavet) {
		this.cavet = cavet;
	}
	public String getLasthearing() {
		return lasthearing;
	}
	public void setLasthearing(String lasthearing) {
		this.lasthearing = lasthearing;
	}
	

}
