package com.dcm.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.dcm.modal.Users;



public interface UsersRepository extends JpaRepository<Users, Integer>{


	Optional<Users> findByEmail(String username);
	
	public Users findByName(String name);
	
	@Query(value = "select username from user where active = 1;", nativeQuery = true)
	public String[] findUsername();
	 
}
