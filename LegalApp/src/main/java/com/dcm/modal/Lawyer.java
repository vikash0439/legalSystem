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
@Table(name= "lawyer")
public class Lawyer {
	
	@Id
	@GeneratedValue
	private int lawyerid;
	private String name;
	private String address;
	private String line2;
	private String city;
	private String state;
	private String country;
	private String pin;
	private String phone;
	private String email;
	private String jname;
	private String jphone;
	private String jemail;
	private String cname;
	private String cphone;
	private String cemail;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "lawyer")
	private Collection<Case> cases=new ArrayList<Case>();
	
//	@OneToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name= "caseid")
//	private Case Case;

	public Lawyer() {
		
	}

	public Lawyer(int lawyerid, String name, String address, String line2, String city, String state, String country,
			String pin, String phone, String email, String jname, String jphone, String jemail, String cname,
			String cphone, String cemail) {
		super();
		this.lawyerid = lawyerid;
		this.name = name;
		this.address = address;
		this.line2 = line2;
		this.city = city;
		this.state = state;
		this.country = country;
		this.pin = pin;
		this.phone = phone;
		this.email = email;
		this.jname = jname;
		this.jphone = jphone;
		this.jemail = jemail;
		this.cname = cname;
		this.cphone = cphone;
		this.cemail = cemail;
		
	}
	
	public Collection<Case> getCases() {
		return cases;
	}

	public void setCases(Collection<Case> cases) {
		this.cases = cases;
	}

	public int getLawyerid() {
		return lawyerid;
	}

	public void setLawyerid(int lawyerid) {
		this.lawyerid = lawyerid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLine2() {
		return line2;
	}

	public void setLine2(String line2) {
		this.line2 = line2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getJname() {
		return jname;
	}

	public void setJname(String jname) {
		this.jname = jname;
	}

	public String getJphone() {
		return jphone;
	}

	public void setJphone(String jphone) {
		this.jphone = jphone;
	}

	public String getJemail() {
		return jemail;
	}

	public void setJemail(String jemail) {
		this.jemail = jemail;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCphone() {
		return cphone;
	}

	public void setCphone(String cphone) {
		this.cphone = cphone;
	}

	public String getCemail() {
		return cemail;
	}

	public void setCemail(String cemail) {
		this.cemail = cemail;
	}

	@Override
	public String toString() {
		return "Lawyer [lawyerid=" + lawyerid + ", name=" + name + ", address=" + address + ", line2=" + line2
				+ ", city=" + city + ", state=" + state + ", country=" + country + ", pin=" + pin + ", phone=" + phone
				+ ", email=" + email + ", jname=" + jname + ", jphone=" + jphone + ", jemail=" + jemail + ", cname="
				+ cname + ", cphone=" + cphone + ", cemail=" + cemail + ", cases=" + cases + "]";
	}
	

}
