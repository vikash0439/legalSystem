package com.dcm.modal;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

public class CustomUserDetails extends Users implements UserDetails{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CustomUserDetails(Users users) {
		super(users);
		// TODO Auto-generated constructor stub
	}

	 @Override
	    public Collection<? extends GrantedAuthority> getAuthorities() {

	        return getRoles()
	                .stream()
	                .map(role -> new SimpleGrantedAuthority("ROLE_" + role.getRole()))
	                .collect(Collectors.toList());
	    }

	@Override
	public String getPassword() {	
		// TODO Auto-generated method stub
		return super.getPassword();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return super.getName();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return super.getActive();
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
