package com.dcm.modal;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "test")
public class Test implements Serializable {
 
    @Id
    public String field1;
    
    public String name;
 
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getField1() {
        return field1;
    }
 
    public void setField1(String field1) {
        this.field1 = field1;
    }
}