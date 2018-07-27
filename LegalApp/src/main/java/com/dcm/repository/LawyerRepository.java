package com.dcm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.dcm.modal.Lawyer;

public interface LawyerRepository extends CrudRepository<Lawyer, Integer>{
	
	public Lawyer findByLawyerid(int lawyerid);
	
	@Query(value = "select name from lawyer;", nativeQuery = true)
	public List<String> findName();
	
	public Lawyer findByName(String name);
	
	

}
