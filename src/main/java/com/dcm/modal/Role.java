package com.dcm.modal;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "role")
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "role_id")
    private int roleId;

    @Column(name = "role")
    private String role;
    
    @JsonIgnore 
	@ManyToOne(cascade = CascadeType.ALL)
    private Users user;

    public Role() {
    }
    

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }


	public Users getUser() {
		return user;
	}


	public void setUser(Users user) {
		this.user = user;
	}
    
}