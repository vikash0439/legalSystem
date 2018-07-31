package com.dcm.modal;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "cases")
public class Case{
	
	@Id 
	private int id;
	private String caseno;
	private String fileno;
	private String dateinstitution;
	private String datesummon;
	private String title;	
	private String act;
	private String versus;
	private String description;	
	private String judgename;
	private String designation;
	private String state;
	private String counter;
	private String address;
	private String cateogry;
	private String nexthearing;
	private String status;
	
	
//	@OneToOne(fetch = FetchType.LAZY, mappedBy = "Case", cascade = CascadeType.ALL)
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "paymentid")
	private Payment payment;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "updateid")
	private UpdateCase updatecase;
	
	
	@ManyToOne(cascade = CascadeType.ALL)
	private Lawyer lawyer;
	
	@ManyToOne(cascade = CascadeType.ALL)
	private Acts acts;
	
	
	/* Constructors */
	
	public Case() {
		
	}
	
	public Case(int id, String caseno, String fileno, String dateinstitution, String datesummon, String title, String act,
			String versus, String description, String judgename, String designation, String state,
			String counter, String address,String status, Payment payment, Lawyer lawyer, Acts acts, UpdateCase updatecase) {
		super();
		this.id = id;
		this.caseno = caseno;
		this.fileno = fileno;
		this.dateinstitution = dateinstitution;
		this.datesummon = datesummon;
		this.title = title;
		
		this.act = act;
		this.versus = versus;
		this.description = description;
		
		this.judgename = judgename;
		this.designation = designation;
		this.state = state;
		this.counter = counter;
		this.address = address;
		this.status = status;
		this.payment = payment;
		this.lawyer = lawyer;
		this.acts = acts;
		this.updatecase = updatecase;
	}
	
	
	
	public UpdateCase getUpdatecase() {
		return updatecase;
	}

	public void setUpdatecase(UpdateCase updatecase) {
		this.updatecase = updatecase;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCaseno() {
		return caseno;
	}
	public void setCaseno(String caseno) {
		this.caseno = caseno;
	}
	public String getFileno() {
		return fileno;
	}
	public void setFileno(String fileno) {
		this.fileno = fileno;
	}
	public String getDateinstitution() {
		return dateinstitution;
	}
	public void setDateinstitution(String dateinstitution) {
		this.dateinstitution = dateinstitution;
	}
	public String getDatesummon() {
		return datesummon;
	}
	public void setDatesummon(String datesummon) {
		this.datesummon = datesummon;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	

	public String getAct() {
		return act;
	}

	public void setAct(String act) {
		this.act = act;
	}

	public String getVersus() {
		return versus;
	}
	public void setVersus(String versus) {
		this.versus = versus;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getJudgename() {
		return judgename;
	}
	public void setJudgename(String judgename) {
		this.judgename = judgename;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCounter() {
		return counter;
	}
	public void setCounter(String counter) {
		this.counter = counter;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public String getCateogry() {
		return cateogry;
	}

	public void setCateogry(String cateogry) {
		this.cateogry = cateogry;
	}

	public String getNexthearing() {
		return nexthearing;
	}

	public void setNexthearing(String nexthearing) {
		this.nexthearing = nexthearing;
	}

	public Lawyer getLawyer() {
		return lawyer;
	}

	public void setLawyer(Lawyer lawyer) {
		this.lawyer = lawyer;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Acts getActs() {
		return acts;
	}

	public void setActs(Acts acts) {
		this.acts = acts;
	}

	@Override
	public String toString() {
		return "Case Id= '<a href=\"/view-cases?id=" + id + "\">" + id +", Title=" + title +" ";
	}

	
	
}
