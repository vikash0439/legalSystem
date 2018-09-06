package com.dcm.modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "acts")
public class Acts {
	
	@Id
	@GeneratedValue
	private int actid;
	private String name;
	private String rules;
	
	
	public Acts() {
		
	}
	
	
	public Acts(int actid, String name, String rules) {
		super();
		this.actid = actid;
		this.name = name;
		this.rules = rules;
	}



	public int getActid() {
		return actid;
	}
	public void setActid(int actid) {
		this.actid = actid;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getRules() {
		return rules;
	}
	public void setRules(String rules) {
		this.rules = rules;
	}
	
	

}
