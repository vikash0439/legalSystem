package com.dcm.modal;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "acts")
public class Acts {
	
	@Id
	@GeneratedValue
	private int actid;
	private String name;
	private String section;
	private String subsection;
	private String rules;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "acts")
	private Collection<Case> cases=new ArrayList<Case>();
	
	public Acts() {
		
	}
	
	
	
	public Acts(int actid, String name, String section, String subsection, String rules, Collection<Case> cases) {
		super();
		this.actid = actid;
		this.name = name;
		this.section = section;
		this.subsection = subsection;
		this.rules = rules;
		this.cases = cases;
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
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getSubsection() {
		return subsection;
	}
	public void setSubsection(String subsection) {
		this.subsection = subsection;
	}
	public String getRules() {
		return rules;
	}
	public void setRules(String rules) {
		this.rules = rules;
	}
	
	

}
