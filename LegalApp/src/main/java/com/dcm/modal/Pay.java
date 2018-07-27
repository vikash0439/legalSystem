package com.dcm.modal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "pay")
public class Pay {
	
	@Id
	@GeneratedValue
	private int updateid;
	private int paymentid;
	private String total;
	private String paid;
	private String balance;
	private String type;
	private String bill;
	private String Remarks;
	
	public Pay() {
		
	}
	
	public Pay(int updateid, int paymentid, String total, String paid, String balance, String type, String bill,
			String remarks) {
		super();
		this.updateid = updateid;
		this.paymentid = paymentid;
		this.total = total;
		this.paid = paid;
		this.balance = balance;
		this.type = type;
		this.bill = bill;
		Remarks = remarks;
	}
	
	
	public Pay(int paymentid, String total, String paid, String balance, String type, String bill, String remarks) {
		super();
		this.paymentid = paymentid;
		this.total = total;
		this.paid = paid;
		this.balance = balance;
		this.type = type;
		this.bill = bill;
		Remarks = remarks;
	}


	public int getUpdateid() {
		return updateid;
	}
	public void setUpdateid(int updateid) {
		this.updateid = updateid;
	}
	public int getPaymentid() {
		return paymentid;
	}
	public void setPaymentid(int paymentid) {
		this.paymentid = paymentid;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getPaid() {
		return paid;
	}
	public void setPaid(String paid) {
		this.paid = paid;
	}
	public String getBalance() {
		return balance;
	}
	public void setBalance(String balance) {
		this.balance = balance;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBill() {
		return bill;
	}
	public void setBill(String bill) {
		this.bill = bill;
	}
	public String getRemarks() {
		return Remarks;
	}
	public void setRemarks(String remarks) {
		Remarks = remarks;
	}
	
}
