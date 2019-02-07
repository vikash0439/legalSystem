package com.dcm.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.dcm.modal.Acts;

public interface ActsRepository extends CrudRepository<Acts, Integer>{
	
	@Query(value = "select name from acts;", nativeQuery = true)
	public List<String> findName();

	public Acts findByName(String name);

}
