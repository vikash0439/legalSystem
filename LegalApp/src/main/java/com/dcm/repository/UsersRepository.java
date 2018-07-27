package com.dcm.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dcm.modal.Users;



public interface UsersRepository extends JpaRepository<Users, Integer>{


	Optional<Users> findByEmail(String username);
	
	public Users findByName(String name);
	 
}
