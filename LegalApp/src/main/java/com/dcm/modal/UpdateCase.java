package com.dcm.modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "updatecase")
public class UpdateCase {
	
	@Id
	@GeneratedValue
	private int updateid;
	private String caseno;
	private String nexthearing;
	private String status;
	
	
	public int getUpdateid() {
		return updateid;
	}
	public void setUpdateid(int updateid) {
		this.updateid = updateid;
	}
	
	public String getCaseno() {
		return caseno;
	}
	public void setCaseno(String caseno) {
		this.caseno = caseno;
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

}
